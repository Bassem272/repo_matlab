% Provide your own values for the confusion matrix
confusionMatrix = [
    50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 50, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 1, 45, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
     0, 0, 0, 2, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;

    % ... (continue providing values for the remaining rows)
];
% ... (Previous code)

% Create a figure
figure;

% Set axis labels
xlabel('Predicted Classes');
ylabel('True Classes');

% Set axis ticks and labels
xticks(1:19);
yticks(1:19);

% Set title
title('Confusion Matrix Heatmap');

% Display color legend
colorbar('Ticks', [0, 0.33, 0.66, 1], 'TickLabels', {'0%', '33%', '66%', '100%'});

% Initialize the cell colors
cellColors = zeros(size(confusionMatrix, 1), size(confusionMatrix, 2), 3);

% Set colors based on whether the cell is on the diagonal or not
for i = 1:size(confusionMatrix, 1)
    for j = 1:size(confusionMatrix, 2)
        if i == j
            % Diagonal cells
            if confusionMatrix(i, j) > 0
                % Dark blue for non-zero diagonal cells
                cellColors(i, j, :) = [0, 0.2, 0.8];
            else
                % Light yellow for zero diagonal cells
                cellColors(i, j, :) = [1, 1, 0.7];
            end
        else
            % Non-diagonal cells
            if confusionMatrix(i, j) > 0
                % Light gray for non-zero non-diagonal cells
                cellColors(i, j, :) = [0.7, 0.7, 0.7];
            else
                % White for zero non-diagonal cells
                cellColors(i, j, :) = [1, 1, 1];
            end
        end
    end
end

% Display rectangles for each cell with the specified colors
for i = 1:size(confusionMatrix, 1)
    for j = 1:size(confusionMatrix, 2)
        rectangle('Position', [j-0.5, size(confusionMatrix, 1)-i+0.5, 1, 1], 'FaceColor', cellColors(i, j, :), 'EdgeColor', 'k');
        text(j, size(confusionMatrix, 1)-i+1, sprintf('%.2f', confusionMatrix(i, j)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'k');
    end
end

% Save the figure as a PDF
saveas(gcf, 'confusion_matrix.pdf');
