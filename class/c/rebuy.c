void push(int i,int j)
{
	
	int k,s;
	int choice;
	for(k=0;k<tr[i].d[j].waiting.size();k++)
	{
		if(tr[i].d[j].left>=tr[i].d[j].waiting[k].sum)
		{
			printf("**********************************************************\n");
	        printf("                ****中国铁路服务****\n");
	        printf("\n");
	        printf("                **排队预约满足提醒**\n");
	        printf("      %s先生，您的购票需求已经满足，是否购票\n",tr[i].d[j].waiting[k].name);
	        printf("\n");
	        printf("                    ----1.购票\n");
	        printf("                    ----2.放弃\n");
	        printf("\n");
	        printf("**********************************************************\n");
	        printf("                    ----#选择："); 
	        scanf("%d",&choice);
	        printf("\n"); 
	    if(choice==1)
	    {
	    	char start[10];
	    	char end[10];
	        int ta,tb;
	        
		  printf("**********************************************************\n");
	      printf("                ****中国铁路服务****\n");
	      printf("\n");
		  printf("                  ----起始站："); 
	      scanf("%s",start);
          printf("\n");
          printf("                  ----终点站："); 
          scanf("%s",end);
          printf("\n");
          for(s=0;s<tr[i].st.size();s++)
	      {
			   if(strcmp(tr[i].st[s].name,start)==0) 
			   {
			     ta=s;
			   }

			   if(strcmp(tr[i].st[s].name,end)==0) 
			   {
			      tb=s;
	    	   }
	      }
	      double p=tr[i].st[tb].price-tr[i].st[ta].price;
	      struct buy temp;
	      printf("\n%s号列车: 起始站：%s, %02d:%02d 开出,终点站:%s, %02d:%02d 到达,\n余票：%d, 票价：%.2lf\n",tr[i].trainno,start,tr[i].st[ta].go/100,tr[i].st[ta].go%100,end,tr[i].st[tb].arr/100,tr[i].st[ta].arr%100,tr[i].d[j-nowtime].left,p); 
	   
	     	    	for(s=0;s<tr[i].d[j].waiting[k].sum;s++)
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
                        
                           tr[i].d[j].people.push_back(temp);
                           tr[i].d[j].left--;
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
	        else if(choice==2);
	        else
	        {
	        		printf("**********************************************************\n");
	                printf("                ****中国铁路服务****\n");
	                printf("\n");
	                printf("              **指令错误，请重新输入**\n");
	                printf("\n");
	                push(i,j);
	        }
	        
	        
		}
		
}

void rebuy()
{
	 char num[20];
	 char no[10];
	 int date,i,j,k;
	 int find=0;
	 int choice; 
	 printf("**********************************************************\n");
	 printf("                 ****中国铁路服务****\n");
     printf("\n");
	 printf("                       退票服务\n"); 
	 printf("\n");
	 printf("                   ----1.继续退票\n"); 
	 printf("                   ----2.返回\n"); 
	 printf("\n");
	 printf("**********************************************************\n");
	 printf("                    ----#选择："); 
	 scanf("%d",&choice);
	 printf("\n");
	 if(choice==2) menu();
     else if(choice==1)
     {
     printf("**********************************************************\n");
	 printf("                 ****中国铁路服务****\n");
     printf("\n");
	 printf("                       退票服务\n"); 
	 printf("\n");
	 printf("                 ----输入身份证:");
	 scanf("%s",num);
	 printf("\n");
	 printf("                 ----输入退票车次:");
	 scanf("%s",no);
	 printf("\n");
	 printf("                 ----输入退票日期:");
	 scanf("%d",&date);
	 printf("\n");
	 for(i=0;i<tr.size();i++)
	 {
	     if(strcmp(tr[i].trainno,no)==0)
	     {
	         for(j=0;j<tr[i].d.size();j++)
	    	 {
			     if(tr[i].d[j].date==date)
			     {
			       for(k=0;k<tr[i].d[j].people.size();k++)
			       {
			       	   if(strcmp(tr[i].d[j].people[k].num,num)==0)
			       	   {
			       	   	  find=1;
			       	   	  printf("**********************************************************\n");
	                      printf("                 ****中国铁路服务****\n");
                          printf("\n");
                          printf("     %s客户：出发：%s,达到：%s,确认退票？\n",tr[i].d[j].people[k].name,tr[i].d[j].people[k].start,tr[i].d[j].people[k].arr); 
                          printf("\n"); 
	                      printf("                    ----1.确认\n"); 
	                      printf("                    ----2.返回\n"); 
	                      printf("\n");
	                      printf("**********************************************************\n");
	                      printf("                    ----#选择："); 
	                      scanf("%d",&choice);
	                      printf("\n");
	                      if(choice==1)
	                      {
			       	   	    tr[i].d[j].people.erase(tr[i].d[j].people.begin()+k);
			       	   	    tr[i].d[j].left++;
			       	   	    printf("**********************************************************\n");
	                        printf("                ****中国铁路服务****\n");
                            printf("\n");
                            printf("               退票成功，欢迎下次光临！\n");
                            printf("\n");
                            printf("**********************************************************\n");
                            printf("\n");
                            
			       	   	  }
			       	   	  else if(choice==2);
			       	   	
			       	   	  else
			       	   	  {
			       	   	  		printf("**********************************************************\n");
	                            printf("                ****中国铁路服务****\n");
	                            printf("\n");
	                            printf("              **指令错误，请重新输入**\n");
	                            printf("\n");
			       	   	  }
			       	   }
			       }	
			     	
			     }
	         }
	 
	     }
	 }
	    if(find==0)
	    {
	 	printf("**********************************************************\n");
	    printf("                ****中国铁路服务****\n");
	    printf("\n");
	    printf("              **查无此票，请重新输入**\n");
	    printf("\n");
	  
	    }
	    else
	    {
	    	  int choose,k,s;
	    	  for(k=0;k<tr[i].d[j].waiting.size();k++)
	          {
		           if(tr[i].d[j].left>=tr[i].d[j].waiting[k].sum)
		           {
			           printf("**********************************************************\n");
	                   printf("                ****中国铁路服务****\n");
	                   printf("\n");
	                   printf("                **排队预约满足提醒**\n");
	                   printf("      %s先生，您的购票需求已经满足，是否购票\n",tr[i].d[j].waiting[k].name);
	                   printf("\n");
	                   printf("                    ----1.购票\n");
	                   printf("                    ----2.放弃\n");
	                   printf("\n");
	                   printf("**********************************************************\n");
	                   printf("                    ----#选择："); 
	                   scanf("%d",&choice);
	                   printf("\n"); 
	              }
	              if(choose==2);
	              else if(choose==1)
	              {
	              	   	    	char start[10];
	    	                    char end[10];
	                            int ta,tb;
	        
		                        printf("**********************************************************\n");
	                            printf("                ****中国铁路服务****\n");
	                            printf("\n");
		                        printf("                  ----起始站："); 
	                            scanf("%s",start);
                                printf("\n");
                                printf("                  ----终点站："); 
                                scanf("%s",end);
                                printf("\n");
                                
                                
	              }
	          }
       } 
     }
     else
     {
     		printf("**********************************************************\n");
	        printf("                ****中国铁路服务****\n");
	        printf("\n");
	        printf("              **指令错误，请重新输入**\n");
	        printf("\n");
     }
	 
	 rebuy();
	 
	                      
}

