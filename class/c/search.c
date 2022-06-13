
void findtrain();

void searchst()
{
	char start[10];
	char end[10];
	int find=0;
	int null=0;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
	printf("                  ----起始站："); 
	scanf("%s",start);
	printf("\n");
    printf("                  ----终点站："); 
    scanf("%s",end);
	printf("\n");
	printf("    满足条件车次:");
	for(i=0;i<tr.size();i++)
	{
		find=0;
		for(j=0;j<tr[i].st.size();j++)
		{
			if(strcmp(tr[i].st[j].name,start)==0) find++;
			if(strcmp(tr[i].st[j].name,end)==0) find++;
		}
		if(find==2)
		{
			printf("\n    %s号列车:  起始站： %s,  终点站： %s,  经停 %d 站\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    各站点经停时间：站点        到达    开出    停靠    票价\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    剩余票量：日期     余量   排队人数\n"); 
			for(j=0;j<tr[i].d.size();j++)
			{
		        printf("              %04d\t%d\t%d\n",tr[i].d[j].date,tr[i].d[j].left,tr[i].d[j].waiting.size());
			} 
			null=1;
		} 
	
	}
	if(null==0)
	printf("    暂无满足条件的车次！！\n"); 
	printf("\n");
	findtrain();
}

void searchnum()
{
	char num[10];
	int find=0;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
	printf("                  ----车次："); 
	scanf("%s",num);
	printf("\n");
	printf("    满足条件车次:");
	for(i=0;i<tr.size();i++)
	{
		if(strcmp(tr[i].trainno,num)==0)
		{
		    find=1;
		    printf("\n    %s号列车:  起始站： %s,  终点站： %s,  经停 %d 站\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    各站点经停时间：站点        到达    开出    停靠    票价\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    剩余票量：日期     余量   排队人数\n"); 
			for(j=0;j<tr[i].d.size();j++)
			{
		        printf("              %04d\t%d\t%d\n",tr[i].d[j].date,tr[i].d[j].left,tr[i].d[j].waiting.size());
			} 
			
		}
		
    }
	if(find==0)
	printf("    暂无满足条件的车次！！\n"); 
	printf("\n");
	findtrain();
}

void searchd()
{
	int date;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
	printf("                   ----日期："); 
	scanf("%d",&date);
	printf("\n");
	printf("    满足条件车次:");
	if(date<nowtime||date>nowtime+2)
	printf("    暂无满足条件的车次！！\n"); 
	else
	{
	   for(i=0;i<tr.size();i++)
	   {
	
		    printf("\n    %s号列车:  起始站： %s,  终点站： %s,  经停 %d 站\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    各站点经停时间：站点        到达    开出    停靠    票价\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    剩余票量：日期     余量   排队人数\n"); 
			for(j=0;j<tr[i].d.size();j++)
			{
				if(tr[i].d[j].date==date)
		        printf("              %04d\t%d\t%d\n",tr[i].d[j].date,tr[i].d[j].left,tr[i].d[j].waiting.size());
			} 
			
		
		
       } 
    }
	printf("\n");
	findtrain();
}

void findtrain()
{
	int choice; 
	printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
    printf("                      查询业务\n");
    printf("\n");
    printf("                  ----1.车次查询\n");
    printf("                  ----2.站点查询\n");
    printf("                  ----3.日期查询\n");
    printf("                  ----4.返回\n");
	printf("\n");
	printf("**********************************************************\n");
	printf("                    ----#选择："); 
	scanf("%d",&choice);
	printf("\n");
	switch(choice)
	{
		case 1:searchnum();break;
		case 2:searchst();break;
		case 3:searchd();break;
		case 4:menu();break;
		default:
			printf("**********************************************************\n");
	        printf("                ****中国铁路服务****\n");
	        printf("\n");
	        printf("              **指令错误，请重新输入**\n");
	        printf("\n");
	        findtrain();
	}
}
