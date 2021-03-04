CREATE USER c##tidal_comm_user IDENTIFIED BY "replace_this_with_secure_password" account unlock;
GRANT CREATE SESSION to c##tidal_comm_user;
GRANT SELECT ON gv_$archive_dest to c##tidal_comm_user;
GRANT SELECT ON gv_$instance to c##tidal_comm_user;
GRANT SELECT ON v_$managed_standby to c##tidal_comm_user;
GRANT SELECT ON v_$database to c##tidal_comm_user;
GRANT SELECT ON dba_hist_sysmetric_summary to c##tidal_comm_user;
