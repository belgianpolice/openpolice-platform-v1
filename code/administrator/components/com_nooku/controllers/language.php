<?php
/**
 * @version		$Id: language.php 1121 2010-05-26 16:53:49Z johan $
 * @category    Nooku
 * @package     Nooku_Administrator
 * @subpackage  Controllers
 * @copyright	Copyright (C) 2007 - 2010 Johan Janssens and Mathias Verraes. All rights reserved.
 * @license		GNU GPLv2 <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
 * @link     	http://www.nooku.org
 */

/**
 * Nooku Language Controller
 *
 * @author      Johan Janssens <johan@joomlatools.org>
 * @category    Nooku
 * @package     Nooku_Administrator
 * @subpackage  Controllers
 */
class NookuControllerLanguage extends NookuController
{
	public function delete()
	{
		parent::delete();
		
		/*
		 * If we have deleted the active language, we get an error, so we set the 
		 * language in the session to the primary lang 
		 */
		
		$nooku = KFactory::get('admin::com.nooku.model.nooku');
		$lang = $nooku->getPrimaryLanguage()->iso_code;
		$nooku->setLanguage($lang);		
	}
	
	public function save() 
	{
		//Create the redirect URL
		$redirect = '&view=language&layout=form&id='.KInput::get('id', 'get', 'int');
		
		try 
		{
			$prefix = KInput::get('iso_code_lang', 'post', 'alpha');
			$suffix = KInput::get('iso_code_country', 'post', 'alpha');
			
			// Recombine the iso_code
			KInput::set('iso_code', strtolower($prefix).'-'.strtoupper($suffix), 'post');
			
		} 
		catch(KInputException $e) 
		{
			$this->setRedirect($redirect, JText::_('The ISO code should consist of the language code and the country code (two letters each), eg "en-GB".'));
			return;
		}

		if(	!trim(KInput::get('name', 'post', 'string')) || !trim(KInput::get('alias', 'post', 'string'))) {
			$this->setRedirect($redirect, JText::_('Please enter a name and an alias.'));
			return;
		}
		
		return parent::save();					
	}
}