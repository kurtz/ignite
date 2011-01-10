<?php

// Site search service
$services['tuiyo.search'] = array(
	'function' => 'plgXMLRPCTuiyoServicesModule::searchSite',
	'docstring' => 'Searches a remote tuiyo site.',
	'signature' => array(array($xmlrpcString, $xmlrpcString, $xmlrpcString))
);

class plgXMLRPCTuiyoServicesModule
{
	/**
	 * Remote Search method
	 *
	 * The sql must return the following fields that are used in a common display
	 * routine: href, title, section, created, text, browsernav
	 *
	 * @param	string	Target search string
	 * @param	string	mathcing option, exact|any|all
	 * @param	string	ordering option, newest|oldest|popular|alpha|category
	 * @return	array	Search Results
	 * @since	1.5
	 */
	function searchSite($searchword, $phrase='', $order='')
	{
		global $mainframe;

		// Initialize variables
		$db		=& JFactory::getDBO();

		// Prepare arguments
		$searchword	= $db->getEscaped( trim( $searchword ) );
		$phrase		= '';
		$ordering	= '';

		// Load search plugins and fire the onSearch event
		JPluginHelper::importPlugin( 'search' );
		$results = $mainframe->triggerEvent( 'onSearch', array( $searchword, $phrase, $ordering ) );

		// Iterate through results building the return array
		require_once(JPATH_ADMINISTRATOR.DS.'components'.DS.'com_search'.DS.'helpers'.DS.'search.php');

		foreach ($results as $i=>$rows)
		{
			foreach ($rows as $j=>$row) {
				$results[$i][$j]->href = preg_match('#^(http|https)://#i', $row->href) ? $row->href : JURI::root().'/'.$row->href;
				$results[$i][$j]->text = SearchHelper::prepareSearchContent( $row->text, 200, $searchword);
			}
		}
		return $results;
	}
}
