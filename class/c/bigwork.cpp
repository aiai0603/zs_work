#include<bits/stdc++.h>
using namespace std;
vector<struct train> tr;   //总存储结构 
int nowtime; 
struct buy
{
	char num[20];
	char name[10];
	char start[10];
	char arr[10];
};
struct wait
{
	char name[10];
	int sum;
};
struct stop
{
	int num;
	char name[10];
	int arr;
	int go;
	char wait[10];
	double price;
		
};
struct day
{
	int date;
	int left;
	vector<struct buy> people;
	vector<struct wait> waiting;
		
};
struct train
{

	char trainno[5];
	char start[10];
	char end[10];
	int all;
	int station;
	vector<struct stop> st;
    vector<struct day> d;
};
void menu()
{
	printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
    printf("                   -----1.查询\n");
    printf("                   -----2.订票\n");
    printf("                   -----3.退票\n");
    printf("                   -----4.退出\n");
	printf("\n");
	printf("**********************************************************\n");
	printf("                   ----#选择："); 
}
#include"search.c"
#include"buy.c"
#include"rebuy.c"
void fail()
{
	printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
	printf("              **指令错误，请重新输入**\n");
	printf("\n");
    printf("                   -----1.查询\n");
    printf("                   -----2.订票\n");
    printf("                   -----3.退票\n");
    printf("                   -----4.退出\n");
	printf("\n");
	printf("**********************************************************\n");
	printf("                   ----#选择："); 
}
void quit()
{
	printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
    printf("\n");
    printf("                   感谢使用本系统\n");
    printf("                    欢迎下次光临\n");
    printf("\n");
	printf("\n");
	printf("**********************************************************\n");
}

void print()
{
	int i,j,k;
	for(i=0;i<tr.size();i++)
	{
	    printf("%s  %s  %s  %d  %d\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].all,tr[i].station);
    	for(j=0;j<tr[i].st.size();j++)
	    {
	        printf("%02d\t%s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].num,tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	    }
	    printf("\n");
	    for(j=0;j<tr[i].d.size();j++)
	    {
	        printf("%04d %d\n定票：\n",tr[i].d[j].date,tr[i].d[j].left);
	        if(tr[i].d[j].people.size()==0)
	        {
	        	 printf("无\n"); 
	        }
	        else
	        {
	        	for(k=0;k<tr[i].d[j].people.size();k++)
	            {
	        	 printf("%s %s %s %s\n",tr[i].d[j].people[k].start,tr[i].d[j].people[k].arr,tr[i].d[j].people[k].name,tr[i].d[j].people[k].num);
	            }
	        }
	        printf("\n");
	        
	        printf("排队：\n");
	        if(tr[i].d[j].waiting.size()==0)
	        {
	        	 printf("无\n"); 
	        	 printf("\n");
	        }
	        else
	        {
	        	for(k=0;k<tr[i].d[j].waiting.size();k++)
	            {
	        	 printf("%s %d\n",tr[i].d[j].waiting[k].name,tr[i].d[j].waiting[k].sum);
	            }
	            printf("\n");
	        }
	        
	    }
	    printf("\n");  
	    
	
    }
   
}

int main()
{
	time_t timep;
    struct tm *p;
    time(&timep);
    p=localtime(&timep);
	nowtime=(1+p->tm_mon)*100+p->tm_mday;
	 
   	FILE *fp;
	int date;
    char trainnum[10];
	int i,j,k;
	struct train t;
	struct stop temp;
	struct day temp2;
    struct buy temp3;
    struct wait temp4;
	int h1,h2,m1,m2;
	
	fp = fopen("高铁车次.txt","r");
	if (fp==NULL)
	{
		cerr << "File Open Error" << endl;
		exit(0);
	}
	while(!feof(fp))
	{
		fscanf(fp,"%s %s %s %d %d",t.trainno,t.start,t.end,&t.all,&t.station);
	
		for(i=0;i<t.station;i++)
		{
		   fscanf(fp,"%d %s %d:%d %d:%d %s %lf",&temp.num,temp.name,&h1,&m1,&h2,&m2,temp.wait,&temp.price);
		   temp.arr=h1*100+m1;
		   temp.go=h2*100+m2;
		   
		   t.st.push_back(temp);
		}
		for(i=nowtime;i<=nowtime+2;i++)
		{
	        
	    	temp2.date=i;
	    	temp2.left=t.all;
	    	t.d.push_back(temp2);
		}
		tr.push_back(t);
		t.d.clear();
		t.st.clear();
	}
	fclose(fp);
	
	fp = fopen("已定票.txt","r");
	if (fp==NULL)
	{
		cerr << "File Open Error" << endl;
		exit(0);
	}
	while(!feof(fp))
	{
	     fscanf(fp,"%d %s %s %s %s %s",&date,trainnum,temp3.start,temp3.arr,temp3.name,temp3.num);
	     for(i=0;i<tr.size();i++)
	     {
	     	if(strcmp(tr[i].trainno,trainnum)==0)
	     	{
	     	
	            for(j=0;j<tr[i].d.size();j++)
	            {
	        	    if(date==tr[i].d[j].date)
	        	    {
	        		tr[i].d[j].people.push_back(temp3);
	        		tr[i].d[j].left--;
	        	    }
	            }
	     	
	        }
	     }
	}
    fclose(fp);
   
    fp = fopen("预约.txt","r");
	if (fp==NULL)
	{
		cerr<<"File Open Error"<<endl;
		exit(0);
	}
	while(!feof(fp))
	{
	     fscanf(fp,"%s %d %s %d",trainnum,&date,temp4.name,&temp4.sum);
	     for(i=0;i<tr.size();i++)
	     {
	     	if(strcmp(tr[i].trainno,trainnum)==0)
	     	{
	     	
	            for(j=0;j<tr[i].d.size();j++)
	            {
	        	    if(date==tr[i].d[j].date)
	        	    {
	        		  tr[i].d[j].waiting.push_back(temp4);
	        	    }
	            }
	     	
	        }
	     }
	}
    fclose(fp);
    
    
    int finish=0;
    int choice;
    menu();
    while(finish!=1)
     {
     	scanf("%d",&choice);
        printf("\n");
        switch(choice)
        {
    	  case 1:findtrain();break;
    	  case 2:buy();break;
    	  case 3:rebuy();break;
    	  case 4:quit();finish=1;break;
    	  default:fail();
	    }
     }
    
    
    print();
	
	return 0;
}
