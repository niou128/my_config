#ifndef _WINDOWSOS_H_
#define _WINDOWSOS_H_

#include "header.h"

class Windowsos : public Os
{
    public:
    Windowsos();
    std::string getName();
    int getArchitecture();
};

#endif