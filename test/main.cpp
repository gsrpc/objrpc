#include <lemoonxx/unittest.hpp>



int main(int args,char **argv)
{
    lemoon::unittest::console_runner runner("gs2c",args,argv);

    return runner.run();
}
