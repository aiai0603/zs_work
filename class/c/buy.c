void buy( )
{
	char start[10];
	char end[10]; 
	int date;
	char num[10]; 
	int i,j,k;
	int null=0;
	int ta,tb;
    double p;
	int find;
	int c; 
	printf("**********************************************************\n");
	printf("                ****中国铁路服务****\n");
	printf("\n");
    printf("                      购票业务\n");
    printf("\n");
    printf("          *温馨提示：不熟悉车次可优先查询*\n");
    printf("\n");
    printf("                  ----1.前往查询\n"); 
	printf("                  ----2.开始购票\n");
    printf("                  ----3.返回\n"); 
    printf("\n");
	printf("**********************************************************\n");
	printf("                    ----#选择："); 
	scanf("%d",&c);
	printf("\n");
	if(c==1) findtrain();
	else if(c==3) menu();
	else if(c==2)
	{
		  printf("**********************************************************\n");
	      printf("                ****中国铁路服务****\n");
	      printf("\n");
		  printf("                  ----起始站："); 
	      scanf("%s",start);
          printf("\n");
          printf("                  ----终点站："); 
          scanf("%s",end);
          printf("\n");
	      printf("                  -----日期："); 
	      scanf("%d",&date);
	      printf("\n");
	      printf("可购买车次：");  
	      for(i=0;i<tr.size();i++)
	      {
	         find=0;
	    	 for(j=0;j<tr[i].st.size();j++)
	    	 {
			   if(strcmp(tr[i].st[j].name,start)==0) 
			   {
			     find++;
			     ta=j;
			   }

			   if(strcmp(tr[i].st[j].name,end)==0) 
			   {
			      find++;
			      tb=j;
	    	   }
	         }
	    	   if(tb>ta)
	    	   {
	    	   	    p=tr[i].st[tb].price-tr[i].st[ta].price;
	    	        if(find==2)
	    	        {
	    	 	         if(date>=nowtime&&date<=nowtime+2)
	    	 	         {
	    	 	            printf("\n%s号列车: 起始站：%s, %02d:%02d 开出,终点站:%s, %02d:%02d 到达,\n余票：%d, 票价：%.2lf\n",tr[i].trainno,start,tr[i].st[ta].go/100,tr[i].st[ta].go%100,end,tr[i].st[tb].arr/100,tr[i].st[ta].arr%100,tr[i].d[date-nowtime].left,p); 
	    	 	            null=1;
	    	 	         } 
	    	 	         
	    	 	         
	    	 	   }
	           }
	     }
	     struct buy temp;
	     struct wait temp2; 
	     int t;
	     int mark;
	     if(null==0)
	     {
	     		printf("    暂无满足条件的车次！！\n");
	     		printf("\n");
	     }
	     else
	     {
	     	    printf("            ----选择购买车次：");
	     	    scanf("%s",&num);
	     	    printf("\n");
	     	    for(i=0;i<tr.size();i++)
	            {
	            		if(strcmp(tr[i].trainno,num)==0)
	            		mark=i;
	            }
	     	    printf("            ----选择购买数量：");
	     	    scanf("%d",&t);
	     	    printf("\n");
	     	    if(t>tr[mark].d[date-nowtime].left)
	     	    {
	     	    	  int choice;
	     	          printf("**********************************************************\n");
	                  printf("                 ****中国铁路服务****\n");
	                  printf("\n");
		              printf("                  余票不足，是否排队？"); 
                      printf("\n");
                      printf("                    ----1.排队\n"); 
                      printf("                    ----2.返回\n"); 
                      printf("\n");
                      printf("**********************************************************\n");
	                  printf("                    ----#选择："); 
	                  scanf("%d",&choice);
	                  printf("\n");
	                  if(choice==2);
	                  else if(choice==1)
	                  {
	                  	 printf("**********************************************************\n");
	                     printf("                ****中国铁路服务****\n");
                         printf("\n");
                         printf("                 ----输入姓名：");
                         scanf("%s",temp2.name);
                         printf("\n");
                         temp2.sum=t;
                         tr[mark].d[date-nowtime].waiting.push_back(temp2);
					    printf("**********************************************************\n");
	                     printf("                ****中国铁路服务****\n");
                         printf("\n");
                         printf("            排队成功，请随时留意排队信息！\n");
                         printf("\n");
                         printf("**********************************************************\n");
                         printf("\n");
	                  }
	                  
	      	    }
	     	    else
	     	    {
	     	    	for(i=0;i<t;i++)
	     	    	{
	     	             printf("**********************************************************\n");
	                     printf("                ****中国铁路服务****\n");
                         printf("\n");
                         printf("                 ----输入姓名：");
                         scanf("%s",temp.name);
                         printf("\n");
                         printf("                ----输入身份证：");
                         scanf("%s",temp.num);
                         printf("\n");
                         strcpy(temp.start,start);
                         strcpy(temp.arr,end);
                        
                           tr[mark].d[date-nowtime].people.push_back(temp);
                           tr[mark].d[date-nowtime].left--;
                     }
                         
                         printf("**********************************************************\n");
	                     printf("                ****中国铁路服务****\n");
                         printf("\n");
                         printf("           订票成功，中国铁路祝您一路顺风！\n");
                         printf("\n");
                         printf("**********************************************************\n");
                         printf("\n");
	     	    }
	     }
	     buy(); 
    }
    else
    {
    	 	printf("**********************************************************\n");
	        printf("                ****中国铁路服务****\n");
	        printf("\n");
	        printf("              **指令错误，请重新输入**\n");
	        printf("\n");
	        buy();
    }
}
