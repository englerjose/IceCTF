#include <iostream>
#include <cstring>
#include <fstream>
#include <unistd.h>

using namespace std;

class Cowsay {

    public:
        Cowsay() : cowsay(""), dashLength(""){}
        ~Cowsay(){}
        void printCow()
        {
            cout << " -" << string(cowsay.length(), '-') << "- " << endl;
            cout << "< " << cowsay << " >" << endl;
            cout << " -" << string(cowsay.length(), '-') << "- " << endl;
            cout << "  |  ^__^" << endl;
            cout << "   - (xx)|________" << endl;
            cout << "     (__)| IceCTF )/|/" << endl;
            cout << "         ||-----w |" << endl;
            cout << "        ||      ||" << endl;
        }

        void getInput(char *filename)
        {
            int len = strlen(filename);
            if(len >= 4 && filename[len-4]=='.' && filename[len-3]=='c' && filename[len-2] == 'o' && filename[len-1] == 'w')
            {
                gid_t gid = getegid();
                setresgid(gid,gid,gid);

                ifstream file;
                file.open(filename);
                if(file.is_open())
                {
                    getline(file, cowsay);
                    printCow();
                }
                else
                    cout << "Could not open file" << endl;
                file.close();

            }
            else
                cout << "Sorry, only .cow files here, please :)" << endl;
        }

    private:
        std::string cowsay;
        std::string dashLength;
};

int main(int argc, char* argv[]){
    if(argc != 2)
        cout << "Usage ./cow file.cow" << endl;
    else
    {
        Cowsay cowsay;
        cowsay.getInput(argv[1]);
    }
    return 0;
}
