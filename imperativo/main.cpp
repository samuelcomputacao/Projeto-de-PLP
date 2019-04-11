#include<iostream>
#include<string>
#include "include/numberService.h"
#include "include/stringService.h"
#include "include/fileService.h"

#include "jsoncpp/json/json.h"

using namespace std;

int main(){
    Json::Value root;

    root["id"]=0;
            Json::Value text;
            text["first"]="c++";
            text["second"]="java";
            text["third"]="js";
    root["text"]=text;
    root["type"]="test";
    root["begin"]=1;
    root["end"]=1;
    Json::StyledWriter writer;
    string strJson=writer.write(root);

    cout<<"JSON WriteTest" << endl << strJson <<endl;
}
