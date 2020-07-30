//+------------------------------------------------------------------+
//|                                                  SymbolPrice.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2019, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
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
   char post[];
   char result[];
   string headers;
   int res;
   string signal = "";
   StringToCharArray(signal,post);
   //--- reset last error
   ResetLastError();
   //--- post data to REST API
   string uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURUSD&AskPrice=" + DoubleToString(SymbolInfoDouble("EURUSD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURUSD", SYMBOL_BID)) + "&PerUSDAsk=1&PerUSDBid=1";
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
      Print("EURUSD Successful");
   }//--- reset last error
   ResetLastError();
   //--- post data to REST API
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=NZDUSD&AskPrice=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_BID)) + "&PerUSDAsk=1&PerUSDBid=1";
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
      Print("NZDUSD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=AUDCAD&AskPrice=" + DoubleToString(SymbolInfoDouble("AUDCAD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("AUDCAD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_ASK));
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
      Print("AUDCAD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=AUDCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("AUDCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("AUDCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("AUDCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=AUDNZD&AskPrice=" + DoubleToString(SymbolInfoDouble("AUDNZD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("AUDNZD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_BID));
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
      Print("AUDNZD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=CADCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("CADCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("CADCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("CADCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=CADJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("CADJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("CADJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("CADJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=CHFJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("CHFJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("CHFJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("CHFJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURAUD&AskPrice=" + DoubleToString(SymbolInfoDouble("EURAUD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURAUD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_BID));
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
      Print("EURAUD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPUSD&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPUSD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPUSD", SYMBOL_BID)) + "&PerUSDAsk=1&PerUSDBid=1";
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
      Print("GBPUSD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=NZDCAD&AskPrice=" + DoubleToString(SymbolInfoDouble("NZDCAD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("NZDCAD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_ASK));
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
      Print("NZDCAD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=NZDCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("NZDCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("NZDCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("NZDCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=NZDJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("NZDJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("NZDJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("NZDJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=USDCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("USDCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("USDCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("USDCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=USDJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("USDJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("USDJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("USDJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=AUDUSD&AskPrice=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_BID)) + "&PerUSDAsk=1&PerUSDBid=1";
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
      Print("AUDUSD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("EURCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("EURCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("EURJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("EURJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURNZD&AskPrice=" + DoubleToString(SymbolInfoDouble("EURNZD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURNZD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_BID));
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
      Print("EURNZD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURGBP&AskPrice=" + DoubleToString(SymbolInfoDouble("EURGBP", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURGBP", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("GBPUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("GBPUSD", SYMBOL_BID));
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
      Print("EURGBP Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=EURCAD&AskPrice=" + DoubleToString(SymbolInfoDouble("EURCAD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("EURCAD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_ASK));
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
      Print("EURCAD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPCHF&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPCHF", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPCHF", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCHF", SYMBOL_ASK));
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
      Print("GBPCHF Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("GBPJPY Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPNZD&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPNZD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPNZD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("NZDUSD", SYMBOL_BID));
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
      Print("GBPNZD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPCAD&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPCAD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPCAD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_ASK));
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
      Print("GBPCAD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=USDCAD&AskPrice=" + DoubleToString(SymbolInfoDouble("USDCAD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("USDCAD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDCAD", SYMBOL_BID));
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
      Print("USDCAD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=GBPAUD&AskPrice=" + DoubleToString(SymbolInfoDouble("GBPAUD", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("GBPAUD", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_ASK))+ "&PerUSDBid=" + DoubleToString(SymbolInfoDouble("AUDUSD", SYMBOL_BID));
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
      Print("GBPAUD Successful");
   }
   
   //--- reset last error
   ResetLastError();
   uri="http://dev.com/MTProvider/api/values/SetSymbolPrice?Symbol=AUDJPY&AskPrice=" + DoubleToString(SymbolInfoDouble("AUDJPY", SYMBOL_ASK)) + "&BidPrice=" + DoubleToString(SymbolInfoDouble("AUDJPY", SYMBOL_BID)) + "&PerUSDAsk=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_BID))+ "&PerUSDBid=" + DoubleToString(1/SymbolInfoDouble("USDJPY", SYMBOL_ASK));
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
      Print("AUDJPY Successful");
   }
  }
//+------------------------------------------------------------------+
