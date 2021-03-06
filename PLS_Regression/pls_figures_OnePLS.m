function pls_figures_OnePLS(RESULTS, X_TABLE, Y_TABLE,...
    Table_permuted_index)

NumRows = Table_permuted_index;
NumVarX = 1:1:size(X_TABLE,2);
NumVarY = 1:1:size(Y_TABLE,2);

figure
plot(NumVarX+0.02, ...
    (RESULTS.X_Loadings(:,1)+0.02), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(NumVarX+0.02,...
    (RESULTS.X_Loadings(:,1))+0.02, ...
    X_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
hold on
plot(NumVarY+0.02, ...
    (RESULTS.Y_Loadings(:,1)), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text(NumVarY+0.02,...
    (RESULTS.Y_Loadings(:,1))+0.02, ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')

title('X- and Y-loadings on the first PLS components');
xlabel('VarNum');
ylabel('PLS-1');


figure
plot(NumRows, ...
    scaledata(RESULTS.X_Scores(:,1),-1,1), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(NumRows+0.02,...
    scaledata(RESULTS.X_Scores(:,1),-1,1)+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
title('Scores on the first PLS components - Scaled in [-1,1]');
xlabel('ObjNum');
ylabel('PLS-1');

figure
plot(NumRows, ...
    (RESULTS.X_Scores(:,1)), 'o',...
    'MarkerFaceColor', 'blue',...
    'MarkerEdgeColor', 'blue')
text(NumRows+0.02,...
    (RESULTS.X_Scores(:,1))+0.02, ...
    X_TABLE.Properties.RowNames,...
    'HorizontalAlignment','left')
hold on
plot(NumVarY,...
    (RESULTS.Y_Loadings(:,1)), 'v',...
    'MarkerFaceColor', 'black', ...
    'MarkerEdgeColor', 'black')
text(NumVarY,...
    (RESULTS.Y_Loadings(:,1))+0.02, ...
    Y_TABLE.Properties.VariableNames,...
    'HorizontalAlignment','left')
title('BIPLOT of PLS-1');
xlabel('ObjNum');
ylabel('PLS-1');

figure
plot(RESULTS.Y, RESULTS.Y_PREDICTED, 'bo',...
    'MarkerFaceColor', 'blue');
title('PLS model results - Scaled');
xlabel('Original Y');
ylabel('PLS-predicted Y');



figure
plot(Table_permuted_index, RESULTS.X_ResidualMatrix, '*');
title('X RESIDUALS');
xlabel('RowNum');
ylabel('Y Residuals');

figure
plot(Table_permuted_index, RESULTS.Y_ResidualMatrix, '*');
title('Y RESIDUALS');
xlabel('RowNum');
ylabel('Y Residuals');

figure
normplot(RESULTS.Y_ResidualMatrix)
title('Normal probability plot of Y residuals')


