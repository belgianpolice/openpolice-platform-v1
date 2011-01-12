<?php
/**
 * @version		$Id: node.php 1121 2010-05-26 16:53:49Z johan $
 * @category    Nooku
 * @package     Nooku_Administrator
 * @subpackage  Controllers
 * @copyright	Copyright (C) 2007 - 2010 Johan Janssens and Mathias Verraes. All rights reserved.
 * @license		GNU GPLv2 <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
 * @link     	http://www.nooku.org
 */


/**
 * Nooku Nodes Controller
 *
 * @author      Mathias Verraes <mathias@joomlatools.org>
 * @category    Nooku
 * @package     Nooku_Administrator
 * @subpackage  Controllers
 */
class NookuControllerNode extends NookuController
{
	public function edit()
	{
		$model 	= KFactory::get('admin::com.nooku.model.editlinks');
		$type 	= KInput::get('type', array('post', 'get'), 'cmd');
		$id 	= KInput::get('id',   array('post', 'get'), 'int');
		$lang	= KInput::get('lang', array('post', 'get'), 'lang');

		// Get editlinks
        $links  = $model->getLinks();

        // Get the originating view
        $referrer   = parse_url($_SERVER['HTTP_REFERER']);
        parse_str($referrer['query'], $referrer);
        $view       = isset($referrer['view']) ? $referrer['view'] : 'dashboard';

		// Store the redirect in the session
		$app = KFactory::get('lib.joomla.application');
		$app->setUserState('nooku.redirect', JRoute::_('index.php?option=com_nooku&view='.$view, false));

		// Genrate the link to the item's editpage
		$redirect =  str_replace('{ID}', $id, $links[$type]) .'&lang='.$lang;
		
		$this->setRedirect($redirect);
	}
	
	public function validate()
	{
		$data = new ArrayObject();
		$data['alias']   = KInput::get('alias', 'post', 'string');
		$data['title']   = KInput::get('title', 'post', 'string');
		$data['id']      = KInput::get('id', 'post', 'int');
		$data['section'] = KInput::get('section', 'post', 'cmd');
		
		$component = KInput::get('component', 'get', 'cmd');
		$component = substr( $component, 4 );
		
		$handler = KFactory::get('admin::com.nooku.event.'. $component);
		if(!$handler->onValidateForm($data)) 
		{
			//Add the message to the message queue
			$app = KFactory::get('lib.joomla.application');
			$app->enqueueMessage(JText::_($handler->getValidationMsg()));
		
			//Prepare the data array to push into the view
			$result = array();
			$result['alias'] = array(
				'value'   => $data['alias'], 
				'message' => KFactory::get('lib.koowa.document.html.renderer.message')->render('message')
			);
			
			$view = $this->getView('json')
				->assign($result)
				->display();
		}
	}
}