//+------------------------------------------------------------------+
//|                                              HistoricalPrice.mq5 |
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
   EventSetTimer(20);
   
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

   string uri="http://dev.com/MTProvider/api/values/GetHistoryMS";
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
      if(ArraySize(result) > 0)
         Print("Server response: ",CharArrayToString(result,0,-1));
      json.Deserialize(result);
      for(int i=0; i<json.Size(); i++)
      {
         string symbolName = json[i]["Symbol"].ToStr();
         ENUM_TIMEFRAMES period = (ENUM_TIMEFRAMES)StringToInteger(json[i]["Period"].ToStr());
         string timeTemp = json[i]["StartTime"].ToStr();
         int intTemp = StringReplace(timeTemp, "T", " ");
         datetime startTime = StringToTime(timeTemp) + 1;//StringToInteger(json[i]["Period"].ToStr());
         timeTemp = json[i]["EndTime"].ToStr();
         intTemp = StringReplace(timeTemp, "T", " ");
         datetime endTime=StringToTime(timeTemp);// - 1;//StringToInteger(json[i]["Period"].ToStr());
         
         MqlRates rates[];
         ArraySetAsSeries(rates,true);
         
         Print(" Symbol: " + symbolName + " Period: " + EnumToString(period) + " StartTime: " + TimeToString(startTime)+ " EndTime: " + TimeToString(endTime));
         
         int copied=CopyRates(
                        symbolName,    // symbol name
                        period ,       // Don't hard code constants PERIOD_CURRENT
                        startTime,     // Start Time:   TimeCurrent()
                        endTime,       // End Time:     TimeCurrent() - 30*60 // 30 Min
                        rates          // array
                     );
   
         if(copied>1)
         {
            Print("Bars copied: "+ IntegerToString(copied));
   
            uri = "http://dev.com/MTProvider/api/values/SetHistoryMSTicks?ID="+ json[i]["ID"].ToStr() + 
                                                                     "&allTicks=" + IntegerToString(copied);
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
               if(ArraySize(result) > 0)
                  Print("Server response: ",CharArrayToString(result,0,-1));
            }
            
            //string format="open = %G, high = %G, low = %G, close = %G, volume = %d";
            //string out;
            //int size=fmin(copied,200);
            for(int j=1; j<=copied; j++)
            {
//               Print(j);
//               string format="open = %G, high = %G, low = %G, close = %G, volume = %d";
//               string out=j+":"+TimeToString(rates[copied-j].time);
//               out=out+" "+StringFormat(format,
//                                        rates[copied-j].open,
//                                        rates[copied-j].high,
//                                        rates[copied-j].low,
//                                        rates[copied-j].close,
//                                        rates[copied-j].tick_volume);
//                                        
//               Print(out);

               uri = "http://dev.com/MTProvider/api/values/SetHistoryDT?MSID="+ json[i]["ID"].ToStr() + 
                                                                  "&Close=" + DoubleToString(rates[copied-j].close) + 
                                                                  "&Open=" + DoubleToString(rates[copied-j].open)+ 
                                                                  "&High=" + DoubleToString(rates[copied-j].high)+ 
                                                                  "&Low=" + DoubleToString(rates[copied-j].low)+ 
                                                                  "&Time=" + TimeToString(rates[copied-j].time)+ 
                                                                  "&Volume=" + DoubleToString(rates[copied-j].tick_volume);
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
                  if(ArraySize(result) > 0)
                     Print("Server response: ",CharArrayToString(result,0,-1));
                  //Print("Successful SetHistoryDT Call");
               }
            }
         }
         else Print("Failed to get history data for the symbol ",Symbol());
  
      }
   }
}
//+------------------------------------------------------------------+
//template<typename T>
//T StringToEnum(string str,T enu)
//  {
//   for(int i=0;i<31;i++)
//      if(EnumToString(enu=(T)i)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16385)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16386)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16387)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16388)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16390)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16392)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16396)==str)
//         return(enu);
//   if(EnumToString(enu=(T)16408)==str)
//         return(enu);
//   if(EnumToString(enu=(T)32769)==str)
//         return(enu);
//   if(EnumToString(enu=(T)49153)==str)
//         return(enu);
//         
////---
//   return(-1);
//  }
