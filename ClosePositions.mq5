//+------------------------------------------------------------------+
//|                                                OpenPositions.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Trade\Trade.mqh>
#include <Trade\AccountInfo.mqh>
#include <JAson.mqh>
#include <Strings\String.mqh>

CTrade  trade;
CAccountInfo accountInfo;
CJAVal json;
CString str1;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(5);
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   string uri="http://dev.com/MTProvider/api/values/GetClosePositions?Username=" + IntegerToString(accountInfo.Login());
   char post[];
   char result[];
   string headers;
   int res;
   string signal = "";
   StringToCharArray(signal,post);
   //--- reset last error
   ResetLastError();
   //--- post data to REST API
   res=WebRequest("GET",uri,NULL,NULL,50,post,ArraySize(post),result,headers);
   //--- check errors
   if(res==-1)
   {
      Print("Error code =",GetLastError());
      //--- maybe the URL is not added, show message to add it
      MessageBox("Add address '"+uri+"' in Expert Advisors tab of the Options window","Error",MB_ICONINFORMATION);
   }
   else
   {
      //--- successful
      Print("Server response: ",CharArrayToString(result,0,-1));
      json.Deserialize(result);
      for(int i=0; i<json.Size(); i++)
      {
      
         bool tradeRes = false;
         string strTemp = json[i]["SymbolName"].ToStr();
         StringTrimRight(strTemp);
         Print(json[i]["TicketNO"].ToInt());
         tradeRes = trade.PositionClose(json[i]["TicketNO"].ToInt());
         
         if(tradeRes)
         {
            uri = "http://dev.com/MTProvider/api/values/SetClosePositions?ID="+ json[i]["ID"].ToStr() + "&ClosePrice=" + DoubleToString(trade.ResultPrice());
            signal = "";
            res = -1;
            ArrayInitialize(post,NULL);
            StringToCharArray(signal,post);
            //--- reset last error
            ResetLastError();
            //--- post data to REST API
            res=WebRequest("POST",uri,NULL,NULL,50,post,ArraySize(post),result,headers);
            //--- check errors
            if(res==-1)
            {
               Print("Error code =",GetLastError());
               //--- maybe the URL is not added, show message to add it
               MessageBox("Add address '"+uri+"' in Expert Advisors tab of the Options window","Error",MB_ICONINFORMATION);
            }   
            else
            {
               Print("Successful SetOpenPositions Call");
            }
         }
         else
         {
            Print("UnSuccessful trade");
         }
      }

    }
  }
//+------------------------------------------------------------------+
