
void findtrain();

void searchst()
{
	char start[10];
	char end[10];
	int find=0;
	int null=0;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****�й���·����****\n");
	printf("\n");
	printf("                  ----��ʼվ��"); 
	scanf("%s",start);
	printf("\n");
    printf("                  ----�յ�վ��"); 
    scanf("%s",end);
	printf("\n");
	printf("    ������������:");
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
			printf("\n    %s���г�:  ��ʼվ�� %s,  �յ�վ�� %s,  ��ͣ %d վ\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    ��վ�㾭ͣʱ�䣺վ��        ����    ����    ͣ��    Ʊ��\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    ʣ��Ʊ��������     ����   �Ŷ�����\n"); 
			for(j=0;j<tr[i].d.size();j++)
			{
		        printf("              %04d\t%d\t%d\n",tr[i].d[j].date,tr[i].d[j].left,tr[i].d[j].waiting.size());
			} 
			null=1;
		} 
	
	}
	if(null==0)
	printf("    �������������ĳ��Σ���\n"); 
	printf("\n");
	findtrain();
}

void searchnum()
{
	char num[10];
	int find=0;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****�й���·����****\n");
	printf("\n");
	printf("                  ----���Σ�"); 
	scanf("%s",num);
	printf("\n");
	printf("    ������������:");
	for(i=0;i<tr.size();i++)
	{
		if(strcmp(tr[i].trainno,num)==0)
		{
		    find=1;
		    printf("\n    %s���г�:  ��ʼվ�� %s,  �յ�վ�� %s,  ��ͣ %d վ\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    ��վ�㾭ͣʱ�䣺վ��        ����    ����    ͣ��    Ʊ��\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    ʣ��Ʊ��������     ����   �Ŷ�����\n"); 
			for(j=0;j<tr[i].d.size();j++)
			{
		        printf("              %04d\t%d\t%d\n",tr[i].d[j].date,tr[i].d[j].left,tr[i].d[j].waiting.size());
			} 
			
		}
		
    }
	if(find==0)
	printf("    �������������ĳ��Σ���\n"); 
	printf("\n");
	findtrain();
}

void searchd()
{
	int date;
	int i,j,k; 
    printf("**********************************************************\n");
	printf("                ****�й���·����****\n");
	printf("\n");
	printf("                   ----���ڣ�"); 
	scanf("%d",&date);
	printf("\n");
	printf("    ������������:");
	if(date<nowtime||date>nowtime+2)
	printf("    �������������ĳ��Σ���\n"); 
	else
	{
	   for(i=0;i<tr.size();i++)
	   {
	
		    printf("\n    %s���г�:  ��ʼվ�� %s,  �յ�վ�� %s,  ��ͣ %d վ\n",tr[i].trainno,tr[i].start,tr[i].end,tr[i].station); 
			printf("    ��վ�㾭ͣʱ�䣺վ��        ����    ����    ͣ��    Ʊ��\n"); 
			for(j=0;j<tr[i].st.size();j++)
	        {
	            printf("                    %s\t%04d\t%04d\t%s\t%.2lf\n",tr[i].st[j].name,tr[i].st[j].arr,tr[i].st[j].go,tr[i].st[j].wait,tr[i].st[j].price);
	        }
			printf("\n");
			printf("    ʣ��Ʊ��������     ����   �Ŷ�����\n"); 
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
	printf("                ****�й���·����****\n");
	printf("\n");
    printf("                      ��ѯҵ��\n");
    printf("\n");
    printf("                  ----1.���β�ѯ\n");
    printf("                  ----2.վ���ѯ\n");
    printf("                  ----3.���ڲ�ѯ\n");
    printf("                  ----4.����\n");
	printf("\n");
	printf("**********************************************************\n");
	printf("                    ----#ѡ��"); 
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
	        printf("                ****�й���·����****\n");
	        printf("\n");
	        printf("              **ָ���������������**\n");
	        printf("\n");
	        findtrain();
	}
}
