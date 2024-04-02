function queue
%choose random generator
    disp(' ');
    disp('Please choose type of random number generator');
    disp('---------------------------------------------');
    disp('1 RANDI Uniformly Distributed Integer');
    disp('2 RANDEXP Exponentially Distributed Integer');
    disp('3 Linear Congruential Generators (LCG)');
    disp('4 RAND Uniform Random Number Generator');    
    
    option = input('->');

    
while(option < 1 || option > 4)
    disp(' ');
    disp('Please choose type of random number generator');
    disp('---------------------------------------------');
    disp('1 RANDI Uniformly Distributed Integer');
    disp('2 RANDEXP Exponentially Distributed Integer');
    disp('3 Linear Congruential Generators (LCG)');
    disp('4 RAND Uniform Random Number Generator');
    
    option = input('->');
end


%choose number of customers 
    disp(' ');
    disp('Please choose the number of customers for the simulation');
    disp('--------------------------------------------------------');
    cus_num = input('->');
    disp(' ');
    
    
%counter 1 service time    
service1_time = 3:7;
service1_prob = probability();
service1_cdf = CDF(service1_prob);
service1_Lowrange = LowRange(service1_cdf);
service1_Upprange = UppRange(service1_cdf);
disp(' ');
    disp('COUNTER 1 SERVICE TIME PROBABILITY TABLE');
    disp('------------------------------------------------------------------------');
    disp('Service time for Counter 1(min)| Probability | CDF  | Random number range');
        for (i=1:5)
            fprintf('               %1.0f               |    %1.2f     | %1.2f |      %2.0f-%2.0f   \n', [service1_time(i) service1_prob(i) service1_cdf(i) service1_Lowrange(i) service1_Upprange(i)]);
        end



%counter 2 service time
service2_time = 3:7;
service2_prob = probability();
service2_cdf = CDF(service2_prob);
service2_Lowrange = LowRange(service2_cdf);
service2_Upprange = UppRange(service2_cdf);
disp(' ');
    disp('COUNTER 2 SERVICE TIME PROBABILITY TABLE');
    disp('------------------------------------------------------------------------');
    disp('Service time for Counter 2(min)| Probability | CDF  | Random number range');
        for (i=1:5)
            fprintf('               %1.0f               |    %1.2f     | %1.2f |      %2.0f-%2.0f   \n', [service2_time(i) service2_prob(i) service2_cdf(i) service2_Lowrange(i) service2_Upprange(i)]);
        end


%counter 3 service time (express counter)
service3_time = 1:5;
service3_prob = probability();
service3_cdf = CDF(service3_prob);
service3_Lowrange = LowRange(service3_cdf);
service3_Upprange = UppRange(service3_cdf);
disp(' ');
    disp('COUNTER 3 SERVICE TIME PROBABILITY TABLE (EXPRESS COUNTER)');
    disp('------------------------------------------------------------------------');
    disp('Service time for Counter 3(min)| Probability | CDF  | Random number range');
        for (i=1:5)
            fprintf('               %1.0f               |    %1.2f     | %1.2f |      %2.0f-%2.0f   \n', [service3_time(i) service3_prob(i) service3_cdf(i) service3_Lowrange(i) service3_Upprange(i)]);
        end


%interarrival time 
inter_arr_time = 1:5;
inter_arr_prob = probability();
inter_arr_cdf = CDF(inter_arr_prob);
inter_arr_Lowrange = LowRange(inter_arr_cdf);
inter_arr_Upprange = UppRange(inter_arr_cdf);
disp(' ');
    disp('INTER ARRIVAL TIME PROBABILITY TABLE');
    disp('------------------------------------------------------------------------');
    disp('Interarrival time(min)| Probability | CDF  | Random number range');
        for (i=1:5)
            fprintf('           %1.0f          |    %1.2f     | %1.2f |      %2.0f-%2.0f   \n', [inter_arr_time(i) inter_arr_prob(i) inter_arr_cdf(i) inter_arr_Lowrange(i) inter_arr_Upprange(i)]);
        end

        
        

    if(option ==1)
        disp(' ');
        disp('-------------------------------------');
        disp(' RANDI Uniformly Distributed Integer ');
        disp('-------------------------------------');
        disp(' ');
        disp('Exhibited Message:');
        disp(' ');
        
        %generate inter-arrival RN
        %random numbers for inter-arrival time
        %generate a set of random integers between 1 and 100
        ran_inter = [randi(ones(1,cus_num), 100*ones(1,cus_num))];  
        
        
        %random numbers for service time
        ran_serve = [randi(ones(1,cus_num), 100*ones(1,cus_num))]; 
        
        
        
        %random number of items, min 1, max 10
        ran_item = zeros(1,cus_num);
        for(i = 1:cus_num)
            
            ran_item(i) = randi(1, 10);
        end
        
    elseif(option==2)
        disp(' ');
        disp('-------------------------------------------');
        disp(' RANDEXP Exponentially Distributed Integer');
        disp('-------------------------------------------');
        disp(' ');
        disp('Exhibited Message:');
        disp(' ');
        
        %random numbers for inter-arrival time
        ran_inter = zeros(1,cus_num);
    
     for i = 1:cus_num
       
         lamda=(100-1)/2;
         ran_inter(i)=round(randexp(lamda))+1;
       
        while ran_inter(i)>100
            ran_inter(i)=round(randexp(lamda))+1;
        end
            
     end
    
    %random numbers for service time
    ran_serve = zeros(1,cus_num);
    
    for i = 1:cus_num
        
        lamda=(100-1)/2;
        ran_serve(i)=round(randexp(lamda))+1;
        
        while ran_serve(i)>100 
            ran_serve(i)=round(randexp(lamda))+1;
        end
            
    end
    

    %random number of items, min 1, max 10
    ran_item = zeros(1,cus_num);
        for(i = 1:cus_num)
            
            ran_item(i) = round(randexp((10-1)/2))+1;
            
            while ran_item(i)>10
            ran_item(i) = round(randexp((10-1)/2))+1;
            end
            
        end
        
        
    
    elseif (option == 3)
        disp(' ');
        disp('-------------------------------------');
        disp('    Linear Congruential Generator    ');
        disp('-------------------------------------');
        disp(' ');
        disp('Exhibited Message:');
        disp(' ');

        %random numbers for inter-arrival time
        %generate a set of random integers between 1 and 100
        ran_inter = round(mod(rand(1, cus_num) * 100, 99)) + 1;


        %random numbers for service time
        ran_serve = round(mod(rand(1, cus_num) * 100, 99)) + 1;


        %random number of items, min 1, max 10
        ran_item = zeros(1,cus_num);
        for(i = 1:cus_num)

            ran_item(i) =  round(mod(rand*10,9)) + 1;
        end
    
    elseif(option ==4)
        disp(' ');
        disp('-------------------------------------');
        disp(' RAND Uniform Random Number Generator ');
        disp('-------------------------------------');
        disp(' ');
        disp('Exhibited Message:');
        disp(' ');
        
        %random numbers for inter-arrival time
        %generate a set of random integers between 1 and 100
        for(i = 1:cus_num)
            A = 1; B = 100; 
            ran_inter = [round(A + (B-A)*rand(1,i))];
        end
        
        %random numbers for service time
        for(i = 1:cus_num)
            A = 1; B = 100; 
            ran_serve = [round(A + (B-A)*rand(1,i))];
        end
        
        %random number of items, min 1, max 10
        ran_item = zeros(1,cus_num);
        for(i = 1:cus_num)
            
            ran_item(i) = randi(1, 10);
        end
        
    end
    
    %Determine inter-arrival time
    
    ran_inter(1) = 0;   % to set the first index as 0   
       
        %inter arrival time based on random number's range
        inter_arr = zeros(1,cus_num);
        inter_arr(1) = 0;   % to set the first index as 0 
        
        for(i = 2:cus_num)
            if(ran_inter(1,i) >= inter_arr_Lowrange(1,1) & ran_inter(1,i) <= inter_arr_Upprange(1,1))
                inter_arr(i) = inter_arr_time(1,1);
            elseif(ran_inter(1,i) >= inter_arr_Lowrange(1,2) & ran_inter(1,i) <= inter_arr_Upprange(1,2))
                inter_arr(i) = inter_arr_time(1,2);
            elseif(ran_inter(1,i) >= inter_arr_Lowrange(1,3) & ran_inter(1,i) <= inter_arr_Upprange(1,3))
                inter_arr(i) = inter_arr_time(1,3);
            elseif(ran_inter(1,i) >= inter_arr_Lowrange(1,4) & ran_inter(1,i) <= inter_arr_Upprange(1,4))
                inter_arr(i) = inter_arr_time(1,4);
            elseif(ran_inter(1,i) >= inter_arr_Lowrange(1,5) & ran_inter(1,i) <= inter_arr_Upprange(1,5))
                inter_arr(i) = inter_arr_time(1,5);
            end
        end
        
    %service time Counter 1 based on random number's range
        serve_time1 = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= service1_Lowrange(1, 1) & ran_serve(1, i) <= service1_Upprange(1, 1))
                serve_time1(i) = service1_time(1,1);
            elseif(ran_serve(1, i) >= service1_Lowrange(1, 2) & ran_serve(1, i) <= service1_Upprange(1, 2))
                serve_time1(i) = service1_time(1,2);
            elseif(ran_serve(1, i) >= service1_Lowrange(1, 3) & ran_serve(1, i) <= service1_Upprange(1, 3))
                serve_time1(i) = service1_time(1,3);
            elseif(ran_serve(1, i) >= service1_Lowrange(1, 4) & ran_serve(1, i) <= service1_Upprange(1, 4))
                serve_time1(i) = service1_time(1,4);
            elseif(ran_serve(1, i) >= service1_Lowrange(1, 5) & ran_serve(1, i) <= service1_Upprange(1, 5))
                serve_time1(i) = service1_time(1,5);
            end
        end
        
        %service time Counter 2 based on random number's range
        serve_time2 = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= service2_Lowrange(1, 1) & ran_serve(1, i) <= service2_Upprange(1, 1))
                serve_time2(i) = service2_time(1,1);
            elseif(ran_serve(1, i) >= service2_Lowrange(1, 2) & ran_serve(1, i) <= service2_Upprange(1, 2))
                serve_time2(i) = service2_time(1,2);
            elseif(ran_serve(1, i) >= service2_Lowrange(1, 3) & ran_serve(1, i) <= service2_Upprange(1, 3))
                serve_time2(i) = service2_time(1,3);
            elseif(ran_serve(1, i) >= service2_Lowrange(1, 4) & ran_serve(1, i) <= service2_Upprange(1, 4))
                serve_time2(i) = service2_time(1,4);
            elseif(ran_serve(1, i) >= service2_Lowrange(1, 5) & ran_serve(1, i) <= service2_Upprange(1, 5))
                serve_time2(i) = service2_time(1,5);
            end
        end
        
        %service time Counter 3 based on random number's range
        serve_time3 = zeros(1,cus_num);   
        for(i = 1:cus_num)
            if(ran_serve(1, i) >= service3_Lowrange(1, 1) & ran_serve(1, i) <= service3_Upprange(1, 1))
                serve_time3(i) = service3_time(1,1);
            elseif(ran_serve(1, i) >= service3_Lowrange(1, 2) & ran_serve(1, i) <= service3_Upprange(1, 2))
                serve_time3(i) = service3_time(1,2);
            elseif(ran_serve(1, i) >= service3_Lowrange(1, 3) & ran_serve(1, i) <= service3_Upprange(1, 3))
                serve_time3(i) = service3_time(1,3);
            elseif(ran_serve(1, i) >= service3_Lowrange(1, 4) & ran_serve(1, i) <= service3_Upprange(1, 4))
                serve_time3(i) = service3_time(1,4);
            elseif(ran_serve(1, i) >= service3_Lowrange(1, 5) & ran_serve(1, i) <= service3_Upprange(1, 5))
                serve_time3(i) = service3_time(1,5);
            end
        end
    
        %calc arrival time (previous arrival time add with current inter-arrival time)
        
        arr_time(1) = 0;
    
        for(i = 2:cus_num)
            arr_time(i) = [arr_time(i-1) + inter_arr(1,i)];
        end
    

        

        
    %---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    %Initialise all to 0
    %service 1 time begins 
    serve_begin1 = [zeros(1,cus_num)];
    %service 1 time ends 
    serve_ends1 = [zeros(1,cus_num)];
    %service 2 time begins 
    serve_begin2 = [zeros(1,cus_num)];
    %service 2 time ends 
    serve_ends2 = [zeros(1,cus_num)];
    %service 3 time begins 
    serve_begin3 = [zeros(1,cus_num)];
    %service 3 time ends 
    serve_ends3 = [zeros(1,cus_num)];
    %waiting time 
    wait_time = [zeros(1,cus_num)];
    %time spent 
    time_spent = [zeros(1,cus_num)];
    %serving time 
    serve_time_end = [zeros(1,cus_num)];
        
    %Table calculation
    %-------------------------------------------------------------------------------------------------
    %customer status(0 = NOT ARIIVE 1= ARRIVE AT QUEUE 2 = AT THE COUNTER, 3 = EXITED THE COUNTER)
    cus_status = zeros(1,cus_num);
    
    %to determine which counter customer went
    cus_counter_status = zeros(1,cus_num);
    
    %counter status(0 = available, 1 = not available)
    counter1_status = 0;
    counter1_serviceEnd = zeros(1,cus_num);
    counter2_status = 0;
    counter2_serviceEnd = zeros(1,cus_num);
    counter3_status = 0;
    counter3_serviceEnd = zeros(1,cus_num);
    
    %time initial set to 0
    time = 0;
    

    
    %control while loop
    to_continue = 1;
    
   while (to_continue == 1)
    
    %set arriving at queue customer status to 1
        for(i= 1:cus_num)
            if(arr_time(i) == time)
                cus_status(i) = 1;
            end
        end
    
    
    %set customer status to 3 if service has ended and counter status to available
        for(i= 1:cus_num)
            if(counter3_serviceEnd(i) == time & cus_status(i) == 2) % if customer at counter and service ended
                counter3_status = 0;
                cus_status(i) = 3; %customer exit
                serve_ends3(1,i) = time;
                serve_time_end(1,i) = time;
                fprintf('Departure of customer%2.0f at minute%3.0f\n\n',[i time])
            end
            if(counter1_serviceEnd(i) == time & cus_status(i) == 2)
                counter1_status = 0;
                cus_status(i) = 3;
                serve_ends1(1,i) = time;
                serve_time_end(1,i) = time;
                fprintf('Departure of customer%2.0f at minute%3.0f\n\n',[i time])
            end
            if(counter2_serviceEnd(i) == time & cus_status(i) == 2)
                counter2_status = 0;
                cus_status(i) = 3;
                serve_ends2(1,i) = time;
                serve_time_end(1,i) = time;
                fprintf('Departure of customer%2.0f at minute%3.0f\n\n',[i time])                
            end
        end
            
    
    
    %set customer who arrive at queue to go to counter and change cus_status to 2
        for(i= 1:cus_num)
            if(cus_status(i) == 1) %if arrive at queue
                if(ran_item(1,i) <=3 & counter3_status ==0) %if item less than 3, go express counter if empty
                    cus_status(i) = 2; %At counter
                    cus_counter_status(i) = 3;
                    counter3_status = 1; %counter 3 busy
                    serve_begin3(1,i) = time;
                    wait_time(i) = time - arr_time(i); %time here is same as time service begin
                    counter3_serviceEnd(i) = time + serve_time3(1,i)+ ran_item(1,i); %servicetime plus number of items
                    time_spent(i) = counter3_serviceEnd(i) - arr_time(i); % time spent in system = service end subtract arrival time
  
                    fprintf('Arrival of customer%2.0f at minute%3.0f and queue at the counter%3.0f\n\n',[i arr_time(i) cus_counter_status(i)]);
        
                    fprintf('Service for customer%2.0f start at minute%3.0f\n\n',[i time]);
                    
                elseif(counter1_status == 0)
                    cus_status(i) = 2;
                    cus_counter_status(i) = 1;
                    counter1_status = 1;
                    serve_begin1(1,i) = time;
                    wait_time(i) = time - arr_time(i);
                    counter1_serviceEnd(i) = time + serve_time1(1,i) + ran_item(1,i); 
                    time_spent(i) = counter1_serviceEnd(i) - arr_time(i);

                    fprintf('Arrival of customer%2.0f at minute%3.0f and queue at the counter%3.0f\n\n',[i arr_time(i) cus_counter_status(i)]);

                    fprintf('Service for customer%2.0f start at minute%3.0f\n\n',[i time]);
                    
                elseif(counter2_status == 0)
                    cus_status(i) = 2;
                    cus_counter_status(i) = 2;
                    counter2_status = 1;
                    serve_begin2(1,i) = time;
                    wait_time(i) = time - arr_time(i);
                    counter2_serviceEnd(i) = time + serve_time2(1,i)+ ran_item(1,i); 
                    time_spent(i) = counter2_serviceEnd(i) - arr_time(i);

                    fprintf('Arrival of customer%2.0f at minute%3.0f and queue at the counter%3.0f\n\n',[i arr_time(i) cus_counter_status(i)]);
                    
                    fprintf('Service for customer%2.0f start at minute%3.0f\n\n',[i time]);                    
                end 
            end
        end
        
        time = time+1;
        counter = 0;
        
        for(i= 1:cus_num)
           if(cus_status(i) == 3 ) %count exited customer
               counter = counter + 1;
           end
       end               
       
       if(counter == cus_num)
           to_continue = 0;
       end
       
    end
    
    %-------------------------------------------------------------------------------------------------------------------------------------------
    %Generate Overall Simulation Table
        disp(' ');
        disp(' N | RN Inter-arrival | Inter-arrival time | Arrival Time | Number of Items');
        disp('   |      Time        |                    |              |    Acquired    ');
        disp('---------------------------------------------------------------------------');
        for(i=1:cus_num)
            if( i==1)
                fprintf('%2.0f |         -        |          -         |     %3.0f      |      %2.0f \n', [i arr_time(1,i) ran_item(1,i)]);
            else
                fprintf('%2.0f |       %3.0f        |        %3.0f         |     %3.0f      |      %2.0f \n', [i ran_inter(1,i) inter_arr(1,i) arr_time(1,i) ran_item(1,i)]);
            end
        end
    %Seperated Simulation Table   
    disp(' ');
    disp('Counter 1:');
    disp(' ');
    disp('  N  | RN for Service  |  Service  | Time Service |  Time Service | Waiting | Time Spent in ');
    disp('     |      Time       |   Time    |    Begins    |      Ends     |   Time  |      System   ');
    disp('--------------------------------------------------------------------------------------------');
        for(i=1:cus_num)
            if(cus_counter_status(i) == 1)
                fprintf(' %2.0f  |       %3.0f       |    %2.0f     |      %3.0f     |      %3.0f      |   %3.0f   |     %2.0f      \n', [i ran_serve(1,i) serve_time1(1,i) serve_begin1(1,i) serve_ends1(1,i) wait_time(i) time_spent(i)]);
            end
        end
        
    disp(' ');
    disp('Counter 2:');
    disp(' ');
    disp('  N  | RN for Service  |  Service  | Time Service |  Time Service | Waiting | Time Spent in ');
    disp('     |      Time       |   Time    |    Begins    |      Ends     |   Time  |      System   ');
    disp('--------------------------------------------------------------------------------------------');
        for(i=1:cus_num)
            if(cus_counter_status(i) == 2)
                fprintf(' %2.0f  |       %3.0f       |    %2.0f     |      %3.0f     |      %3.0f      |   %3.0f   |     %2.0f      \n', [i ran_serve(1,i) serve_time2(1,i) serve_begin2(1,i) serve_ends2(1,i) wait_time(i) time_spent(i)]);
            end
        end
        
    disp(' ');
    disp('Counter 3:');
    disp(' ');
    disp('  N  | RN for Service  |  Service  | Time Service |  Time Service | Waiting | Time Spent in ');
    disp('     |      Time       |   Time    |    Begins    |      Ends     |   Time  |      System   ');
    disp('--------------------------------------------------------------------------------------------');
        for(i=1:cus_num)
            if(cus_counter_status(i) == 3)
                fprintf(' %2.0f  |       %3.0f       |    %2.0f     |      %3.0f     |      %3.0f      |   %3.0f   |     %2.0f      \n', [i ran_serve(1,i) serve_time3(1,i) serve_begin3(1,i) serve_ends3(1,i) wait_time(i) time_spent(i)]);
            end
        end
        
%Evaluation of results of the simulation (average waiting time of a customer,
%average inter-arrival time, average arrival time, average time spent,
%probability that a customer has to wait in the queue and average service time for each server
%------------------------------------------------------------------------------------------------
        disp(' ');
        disp('Evaluation Results of Simulation');
        disp('---------------------------------');
        %average wating time of a customer
        total_wait = 0;
        for(i=1:cus_num)
            total_wait = total_wait + wait_time(1,i);
        end
        avg_wait = total_wait / cus_num;
        
        %average inter-arrival time
        total_inter_arr_time = 0;
        for(i=2:cus_num)
            total_inter_arr_time = total_inter_arr_time + inter_arr(1,i);
        end
        avg_inter_arr_time = total_inter_arr_time / (cus_num-1);
        
        
        %average time spent
        total_time_spent = 0;
        for(i=1:cus_num)
            total_time_spent = total_time_spent + time_spent(i);
        end
        avg_time_spent = total_time_spent / cus_num;
        
        %probability that a customer has to wait in queue
        num_cus_wait = 0;
        for(i=1:cus_num)
            if(wait_time(i)> 0)
                num_cus_wait = num_cus_wait +1;
            end
        end
        prob_cus_wait = num_cus_wait / cus_num; 
        
        %average service time for each counter 
        total_serve1 = 0;
        total_serve2 = 0;
        total_serve3 = 0;
        cus_num_counter1 =0;
        cus_num_counter2 =0;
        cus_num_counter3 =0;
        
        for(i=1:cus_num)
            if(cus_counter_status(i) == 1)
                total_serve1 = total_serve1 + serve_time1(1, i) + ran_item(1,i);
                cus_num_counter1 = cus_num_counter1 + 1;
            elseif(cus_counter_status(i) ==2)
                total_serve2 = total_serve2 + serve_time2(1, i) + ran_item(1,i);
                cus_num_counter2 = cus_num_counter2 + 1;
            elseif(cus_counter_status(i) ==3)
                total_serve3 = total_serve3 + serve_time3(1, i) + ran_item(1,i);
                cus_num_counter3 = cus_num_counter3 + 1;
            end         
        end
        
        avg_serve1 = total_serve1 / cus_num_counter1;
        avg_serve2 = total_serve2 / cus_num_counter2;
        avg_serve3 = total_serve3 / cus_num_counter3;
        
        %---------------------------------------------------------------------------------------------      
        %display Evaluation
        
        disp('Average wating time of a customer : ', avg_wait);
        disp('Average inter-arrival time        : ',avg_inter_arr_time);
        disp('Average time spent                : ',avg_time_spent);
        disp('Probability that a customer has to wait in queue: ',prob_cus_wait );
        disp('Average service time for Counter1 : ',avg_serve1 );
        disp('Average service time for Counter2 : ',avg_serve2 );
        disp('Average service time for Counter3 : ',avg_serve3 );
        
        
       
        
        
        
        
        
        
    
        
  
    
                    
                    

                       
 
    
        