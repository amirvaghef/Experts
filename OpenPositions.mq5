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
   string uri="http://dev.com/MTProvider/api/values/GetOpenPositions?Username=" + IntegerToString(accountInfo.Login());
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
         string usdSymbol = json[i]["PriceInUSDSymbol"].ToStr();
         string usdPrice = "1";
         StringTrimRight(strTemp);
         if(!json[i]["PositionState"].ToBool())
         {
            Print("Buy ", json[i]["Volume"].ToDbl());
            tradeRes = trade.Buy(json[i]["Volume"].ToDbl(), strTemp); 
            if(StringFind(strTemp, "USD", 0) > 1){
               usdPrice = DoubleToString(trade.ResultPrice());
            }
            else if(StringFind(strTemp, "USD", 0) == 0)
            {
               usdPrice = "1";
               
            }
            else if(StringFind(strTemp, "USD", 0) == -1)
            {
               if(StringFind(usdSymbol, "USD", 0) < 1){
                  usdPrice = DoubleToString(1/SymbolInfoDouble(usdSymbol, SYMBOL_BID));      
               }
               else{
                  usdPrice = DoubleToString(SymbolInfoDouble(usdSymbol, SYMBOL_ASK));      
               }
            }            
         }
         else
         {
            Print("Sell ", json[i]["Volume"].ToDbl());
            tradeRes = trade.Sell(json[i]["Volume"].ToDbl(), strTemp);      
            if(StringFind(strTemp, "USD", 0) > 1){
               usdPrice = DoubleToString(trade.ResultPrice());
            }
            else if(StringFind(strTemp, "USD", 0) == 0)
            {
               usdPrice = "1";
               
            }
            else if(StringFind(strTemp, "USD", 0) == -1)
            {
               if(StringFind(usdSymbol, "USD", 0) < 1){
                  usdPrice = DoubleToString(1/SymbolInfoDouble(usdSymbol, SYMBOL_ASK));      
               }
               else{
                  usdPrice = DoubleToString(SymbolInfoDouble(usdSymbol, SYMBOL_BID));      
               }
            }   
         }
         
         if(tradeRes)
         {
            uri = "http://dev.com/MTProvider/api/values/SetOpenPositions?ID="+ json[i]["ID"].ToStr() + "&TicketNO=" + IntegerToString(trade.ResultOrder()) + "&Price=" + DoubleToString(trade.ResultPrice()) + "&USDPrice=" + usdPrice;
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
