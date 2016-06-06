function optimalParameters = hillClimb(initParams,f,iterCount,stepSize,gamma)
    parameterVectorSize = size(initParams);
    lossVector = zeros(1,iterCount);
    
    oldParameters = initParams;
    oldLoss =  f(initParams);
    for i = 1:iterCount
            newParameters = oldParameters + randn(parameterVectorSize)*stepSize;
            newLoss = f(newParameters);
            if (newLoss < oldLoss)
                oldParameters = newParameters;
                oldLoss = newLoss;
            end
            
            lossVector(i) = oldLoss;
            stepSize = stepSize*gamma;
    end
    
    lossVector'
    
    
    optimalParameters = oldParameters
end