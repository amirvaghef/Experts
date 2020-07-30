//+------------------------------------------------------------------+
//|                                                         test.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <Trade\Trade.mqh>
#include <Trade\AccountInfo.mqh>
#include <JAson.mqh>

CTrade  trade;
CAccountInfo accountInfo;
CJAVal json;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   EventSetMillisecondTimer(5000);

   Print(accountInfo.Login());
   Print(accountInfo.Name());
   
   /*  if(!trade.PositionClose(693509))
        {
        //--- failure message
        Print("PositionClose() method failed. Return code=",trade.ResultRetcode(),
              ". Code description: ",trade.ResultRetcodeDescription());
       }
        else
       {
        Print("PositionClose() method executed successfully. Return code=",trade.ResultDeal(),
              " (",trade.ResultOrder(),")");
       }


        double price=SymbolInfoDouble("GBPUSD",SYMBOL_ASK);
        if(!trade.PositionOpen("GBPUSD",ORDER_TYPE_BUY,0.01,price,0,0,"asdasd"))
        {
        //--- failure message
        Print("PositionOpen() method failed. Return code=",trade.ResultRetcode(),
              ". Code description: ",trade.ResultRetcodeDescription());
       }
        else
       {
        Print("PositionOpen() method executed successfully. Return code=",trade.ResultDeal(),
              " (",trade.ResultOrder(),")");
       }
        if(!trade.Buy(0.01))
        {
        //--- failure message
        Print("PositionOpen() method failed. Return code=",trade.ResultRetcode(),
              ". Code description: ",trade.ResultRetcodeDescription());
       }
        else
       {
        Print("PositionOpen() method executed successfully. Return code=",trade.ResultDeal(),
              " (",trade.ResultOrder(),")");
       }



*/
trade.res
     string uri="http://dev.com/MTProvider/api/values/GetClosePositions?Username=Ali";
     char post[];
     char result[];
     string headers;
     int res;
     string signal = "";//"id_ea=1&symbol=AUDUSD&operation=BUY&value=0.9281&";
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
        string out = CharArrayToString(result,0,-1);
        Print("REST client's POST: ",signal);
        Print("Server response: ",CharArrayToString(result,0,-1));
        json.Deserialize(result);
        Print(json[1]["SymbolName"].ToStr());

       }   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
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
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }
//+------------------------------------------------------------------+
