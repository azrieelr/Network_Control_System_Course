clf 

figure(1)
plot(out.SmithPred.time, out.SmithPred.signals(1).values)
hold on
plot(out.SmithPred.time, out.SmithPred.signals(2).values)
xlabel('Time (s)')
ylabel('Output')
title('Smith Predictor')
legend('ref','act')

figure(2)
plot(out.SmithPredLoop.time, out.SmithPredLoop.signals(1).values)
hold on
plot(out.SmithPredLoop.time, out.SmithPredLoop.signals(2).values)
xlabel('Time (s)')
ylabel('Output')
title('Smith Predictor and Without Delay')
legend('Smith Pred','Without Delay')

figure(3)
plot(out.WODelay.time, out.WODelay.signals(1).values)
hold on
plot(out.WODelay.time, out.WODelay.signals(2).values)
xlabel('Time (s)')
ylabel('Output')
title('Closed Loop Without Delay')
legend('act','ref')

figure(4)
plot(out.WithDelay.time, out.WithDelay.signals(1).values)
hold on
plot(out.WithDelay.time, out.WithDelay.signals(2).values)
xlabel('Time (s)')
ylabel('Output')
title('Closed Loop With Delay')
legend('ref','act')

figure(5)
plot(out.Combine.time, out.Combine.signals(1).values)
hold on
plot(out.Combine.time, out.Combine.signals(2).values)
hold on
plot(out.Combine.time, out.Combine.signals(3).values)
xlabel('Time (s)')
ylabel('Output')
title('Combine Closed Loop System')
legend('Without Delay','Smith Pred','With Delay')