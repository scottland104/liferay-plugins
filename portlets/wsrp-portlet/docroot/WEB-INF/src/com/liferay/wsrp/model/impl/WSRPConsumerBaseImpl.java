/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.wsrp.model.impl;

import com.liferay.portal.kernel.exception.SystemException;

import com.liferay.wsrp.model.WSRPConsumer;
import com.liferay.wsrp.service.WSRPConsumerLocalServiceUtil;

/**
 * The extended model base implementation for the WSRPConsumer service. Represents a row in the &quot;WSRP_WSRPConsumer&quot; database table, with each column mapped to a property of this class.
 *
 * <p>
 * This class exists only as a container for the default extended model level methods generated by ServiceBuilder. Helper methods and all application logic should be put in {@link WSRPConsumerImpl}.
 * </p>
 *
 * @author Brian Wing Shun Chan
 * @see WSRPConsumerImpl
 * @see com.liferay.wsrp.model.WSRPConsumer
 * @generated
 */
public abstract class WSRPConsumerBaseImpl extends WSRPConsumerModelImpl
	implements WSRPConsumer {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. All methods that expect a w s r p consumer model instance should use the {@link WSRPConsumer} interface instead.
	 */
	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			WSRPConsumerLocalServiceUtil.addWSRPConsumer(this);
		}
		else {
			WSRPConsumerLocalServiceUtil.updateWSRPConsumer(this);
		}
	}
}