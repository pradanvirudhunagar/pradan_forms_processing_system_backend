 // Status 1
  const [status1] = await connection.execute(
    `SELECT status, COUNT(*) AS count
     FROM forms
     WHERE user_id = ? AND status = ?
     GROUP BY status`,
    [1, 1]
  );

  // Status 2
  const [status2] = await connection.execute(
    `SELECT status, COUNT(*) AS count
     FROM forms
     WHERE user_id = ? AND status = ?
     GROUP BY status`,
    [1, 2]
  );

  // Status 3
  const [status3] = await connection.execute(
    `SELECT status, COUNT(*) AS count
     FROM forms
     WHERE user_id = ? AND status = ?
     GROUP BY status`,
    [1, 3]
  );

  // Status 4
  const [status4] = await connection.execute(
    `SELECT status, COUNT(*) AS count
     FROM forms
     WHERE user_id = ? AND status = ?
     GROUP BY status`,
    [1, 4]
  );

  //integrated count

  `SELECT status, COUNT(*) AS count
     FROM forms
     WHERE user_id = ?
     AND status IN (1, 2, 3, 4)
     GROUP BY status`,
    [1] // user_id

    // fixed_improvements

    const query = `
  SELECT s.status, COUNT(f.status) AS count
  FROM (
    SELECT 1 AS status
    UNION ALL
    SELECT 2
    UNION ALL
    SELECT 3
    UNION ALL
    SELECT 4
  ) AS s
  LEFT JOIN forms f ON f.status = s.status AND f.user_id = ?
  GROUP BY s.status
  ORDER BY s.status;
`;