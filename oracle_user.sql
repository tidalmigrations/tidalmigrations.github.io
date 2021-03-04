CREATE USER tidal identified by "replace_with_secure_password";

GRANT CREATE SESSION to tidal;

GRANT SELECT ON v$parameter to tidal;
GRANT SELECT ON v_$parameter to tidal;
GRANT SELECT ON gv$parameter to tidal;
GRANT SELECT ON gv_$parameter to tidal;

GRANT SELECT ON dba_data_files to tidal;

GRANT SELECT ON ALL_SDO_GEOM_METADATA to tidal;

GRANT SELECT ON DBA_ENCRYPTED_COLUMNS to tidal;

GRANT SELECT ON DBA_TABLESPACES to tidal;

GRANT SELECT ON V$OSSTAT to tidal;
GRANT SELECT ON V$OSSTAT to tidal;
GRANT SELECT ON V_$OSSTAT to tidal;
GRANT SELECT ON V_$OSSTAT to tidal;

GRANT SELECT ON dba_directories to tidal;

GRANT SELECT ON dba_external_tables to tidal;

GRANT SELECT ON dba_views to tidal;

GRANT SELECT ON dba_objects to tidal;

GRANT SELECT ON dba_sequences to tidal;

GRANT SELECT ON dba_feature_usage_statistics to tidal;

GRANT SELECT ON DBA_JSON_COLUMNS to tidal;

GRANT SELECT ON dba_tab_columns to tidal;

GRANT SELECT ON dba_part_tables to tidal;

GRANT SELECT ON DBA_UNUSED_COL_TABS to tidal;

GRANT SELECT ON dba_indexes to tidal;

GRANT SELECT ON dba_constraints to tidal;

GRANT SELECT ON dba_part_key_columns to tidal;

GRANT SELECT ON dba_tab_cols to tidal;

GRANT SELECT ON dba_source to tidal;

GRANT SELECT ON DBA_MVIEWS to tidal;

GRANT SELECT ON dba_jobs to tidal;

GRANT SELECT ON DBA_MVIEW_LOGS to tidal;

GRANT SELECT ON dba_triggers to tidal;

GRANT SELECT ON dba_queues to tidal;

GRANT SELECT ON dba_tablespaces to tidal;

GRANT SELECT ON gv$result_cache_objects to tidal;
GRANT SELECT ON gv_$result_cache_objects to tidal;

GRANT SELECT ON dba_tables to tidal;

GRANT SELECT ON DBA_SCHEDULER_JOBS to tidal;

GRANT SELECT ON GV$RESTORE_POINT to tidal;
GRANT SELECT ON GV_$RESTORE_POINT to tidal;

GRANT SELECT ON dba_sql_plan_baselines to tidal;

GRANT SELECT ON DBA_INDEXES to tidal;

GRANT SELECT ON gv$instance to tidal;
GRANT SELECT ON gv_$instance to tidal;

GRANT SELECT ON V$RMAN_BACKUP_JOB_DETAILS to tidal;
GRANT SELECT ON V_$RMAN_BACKUP_JOB_DETAILS to tidal;

GRANT SELECT ON GV$RSRC_PLAN to tidal;
GRANT SELECT ON GV_$RSRC_PLAN to tidal;

GRANT SELECT ON v$managed_standby to tidal;
GRANT SELECT ON v_$managed_standby to tidal;

GRANT SELECT ON gv$archive_dest to tidal;
GRANT SELECT ON gv_$archive_dest to tidal;

GRANT SELECT ON dba_synonyms to tidal;

GRANT SELECT ON V$OPTION to tidal;
GRANT SELECT ON V_$OPTION to tidal;

GRANT SELECT ON V$SGA to tidal;
GRANT SELECT ON V_$SGA to tidal;

GRANT SELECT ON CDB_PDB_HISTORY to tidal;

GRANT SELECT ON dba_nested_tables to tidal;

GRANT SELECT ON v$instance to tidal;
GRANT SELECT ON v_$instance to tidal;

GRANT SELECT ON dba_capture to tidal;

GRANT SELECT ON dba_libraries to tidal;

GRANT SELECT ON DBA_WORKLOAD_CAPTURES to tidal;

GRANT SELECT ON dba_role_privs to tidal;

GRANT SELECT ON dba_policies to tidal;

GRANT SELECT ON DBA_SEC_RELEVANT_COLS to tidal;

GRANT EXECUTE ON dbms_utility to tidal;

GRANT EXECUTE ON DBMS_XDB to tidal;

GRANT SELECT ON DBA_FGA_AUDIT_TRAIL to tidal;

GRANT SELECT ON DBA_NESTED_TABLES to tidal;

GRANT SELECT ON dba_source to tidal;

GRANT SELECT ON gv$sgainfo to tidal;
GRANT SELECT ON gv_$sgainfo to tidal;

GRANT SELECT ON dba_hist_sysmetric_summary to tidal;

GRANT SELECT ON dual to tidal;

GRANT SELECT ON gv$license to tidal;
GRANT SELECT ON gv_$license to tidal;

GRANT SELECT ON v$sgainfo to tidal;
GRANT SELECT ON v_$sgainfo to tidal;

GRANT SELECT ON dba_hist_osstat to tidal;

GRANT SELECT ON v$database to tidal;
GRANT SELECT ON v_$database to tidal;

GRANT SELECT ON v$instance to tidal;
GRANT SELECT ON v_$instance to tidal;

GRANT SELECT ON DBA_HIST_ACTIVE_SESS_HISTORY to tidal;

GRANT SELECT ON dba_db_links to tidal;

GRANT SELECT ON dba_tab_privs to tidal;

GRANT SELECT ON GV$SESSION_CONNECT_INFO to tidal;
GRANT SELECT ON GV_$SESSION_CONNECT_INFO to tidal;

GRANT SELECT ON GV$SESSION to tidal;
GRANT SELECT ON GV_$SESSION to tidal;

GRANT SELECT ON v$version to tidal;
GRANT SELECT ON v_$version to tidal;

GRANT SELECT ON GV$SQL_PLAN to tidal;
GRANT SELECT ON GV_$SQL_PLAN to tidal;

GRANT SELECT ON Gv$SQL to tidal;
GRANT SELECT ON Gv_$SQL to tidal;

GRANT SELECT ON V$SEGMENT_STATISTICS to tidal;
GRANT SELECT ON V_$SEGMENT_STATISTICS to tidal;

GRANT SELECT ON V$TABLESPACE to tidal;
GRANT SELECT ON V_$TABLESPACE to tidal;

GRANT SELECT ON DBA_APPLY to tidal;

GRANT SELECT ON DBA_TYPES to tidal;

GRANT SELECT ON DBA_ROLES to tidal;

GRANT EXECUTE ON DBMS_METADATA to tidal;

GRANT SELECT ON gv$restore_point to tidal;
GRANT SELECT ON GV_$RESTORE_POINT to tidal;

GRANT select_catalog_role to tidal;
