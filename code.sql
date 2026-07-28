SELECT
    B.BoardName,

    COUNT(PR.ProjectID) AS OngoingProjects,

    ISNULL(SUM(PR.Cost),0) AS TotalCost

FROM BoardsMaster B

LEFT JOIN ProjectsMaster PR
    ON B.BoardID = PR.BoardID
    AND PR.Status='Ongoing'

WHERE B.DeleteFlag=0

GROUP BY
    B.BoardID,
    B.BoardName;
