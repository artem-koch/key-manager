<?php
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * Easy set variables
     */
     
    /* Array of database columns which should be read and sent back to DataTables. Use a space where
     * you want to insert a non-database field (for example a counter or static image)
     */
    $aColumns = array( 'uid', 'username', 'pw' );
     
    /* Indexed column (used for fast and accurate table cardinality) */
    $sIndexColumn = "uid";
     
    /* DB table to use */
    $sTable = "user";
     
    /* Database connection information */
    $gaSql['user']       = "programmuser";
    $gaSql['password']   = "1234";
    $gaSql['db']         = "key-manager";
    $gaSql['server']     = "localhost:3306";
      
     
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
     * If you just want to use the basic configuration for DataTables with PHP server-side, there is
     * no need to edit below this line
     */
    
    /*
     * MySQL connection
     */
    $gaSql['link'] =  mysql_pconnect( $gaSql['server'], $gaSql['user'], $gaSql['password']  ) or
    die( 'Could not open connection to server' );
    
    mysql_select_db( $gaSql['db'], $gaSql['link'] ) or
    die( 'Could not select database '. $gaSql['db'] );
    
    
    /*
     * Paging
    */
    $sLimit = "";
    if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
    {
    	$sLimit = "LIMIT ".mysql_real_escape_string( $_GET['iDisplayStart'] ).", ".
    			mysql_real_escape_string( $_GET['iDisplayLength'] );
    }
    
    
    /*
     * Ordering
     */
    if ( isset( $_GET['iSortCol_0'] ) )
    {
    	$sOrder = "ORDER BY  ";
    	for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
    	{
    		if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
    		{
    			$sOrder .= $aColumns[ intval( $_GET['iSortCol_'.$i] ) ]."
				 	".mysql_real_escape_string( $_GET['sSortDir_'.$i] ) .", ";
    		}
    	}
    
    	$sOrder = substr_replace( $sOrder, "", -2 );
    	if ( $sOrder == "ORDER BY" )
    	{
    		$sOrder = "";
    	}
    }
?>