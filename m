Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F407FC433DB
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 22:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C79EC619CF
	for <linux-mips@archiver.kernel.org>; Tue, 30 Mar 2021 22:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbhC3WKs convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:10:48 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:59771 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232908AbhC3WKR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 18:10:17 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-141-FmJUjqj9ObmGu4umX09xKQ-1; Tue, 30 Mar 2021 23:10:13 +0100
X-MC-Unique: FmJUjqj9ObmGu4umX09xKQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 30 Mar 2021 23:10:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 30 Mar 2021 23:10:13 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Christoph Hellwig' <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] MIPS: uaccess: Remove get_fs/set_fs call sites
Thread-Topic: [PATCH 2/3] MIPS: uaccess: Remove get_fs/set_fs call sites
Thread-Index: AQHXJY0yDUIm9QRgRkmPSPWPs+HsZKqdFp4Q
Date:   Tue, 30 Mar 2021 22:10:13 +0000
Message-ID: <5d1aa493b9e7441194677855de560544@AcuMS.aculab.com>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
 <20210330172702.146909-3-tsbogend@alpha.franken.de>
 <20210330174943.GB15145@lst.de>
In-Reply-To: <20210330174943.GB15145@lst.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Christoph Hellwig
> Sent: 30 March 2021 18:50
> 
> On Tue, Mar 30, 2021 at 07:26:59PM +0200, Thomas Bogendoerfer wrote:
> > +#define __get_data(x, ptr, u)						\
> > +	(((u) == true) ? __get_udata((x), (ptr), sizeof(*(ptr))) :	\
> > +			__get_kdata((x), (ptr), sizeof(*(ptr))))
> > +
> 
> I'm a little worried about exposing this in uaccess.h.  Can you
> have local helpers insted, preferably strongly typed for their
> specific use cases?

For things that aren't performance critical it may be worth
using a structure that contains both a kernel and user address
(one of which will be NULL) and passing the offset as a separate
parameter.

(That might have been better for the socket option buffer.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

