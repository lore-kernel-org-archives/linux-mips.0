Received: from smtp1.dnsmadeeasy.com ([205.234.170.134]:39070 "EHLO
	smtp1.dnsmadeeasy.com") by ftp.linux-mips.org with ESMTP
	id S24063297AbZAEDfT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 5 Jan 2009 03:35:19 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE:  SMP8634 Linux boot
Date: Sun, 4 Jan 2009 19:35:05 -0800
Message-ID: <01049E563C8ECC43AD6B53A5AF419B380128FE3B@avtrex-server2.hq2.avtrex.com>
In-Reply-To: <gjqihv$h6m$1@ger.gmane.org>
From: "Mark Edson" <medson@avtrex.com>
Return-Path: <medson@avtrex.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Andi <opencode@gmx.net>, linux-mips@linux-mips.org
Message-ID: <20090105033505.rwtb8YwHO2jOuLfBMAGj16WGT3-uxSa2HcZk8kBnJKI@z>

We use MAJIC-LT boot loader.  Our steps on the MAJIC-LT host are:
	$ cd /opt/edtm/targets/sigma_vantage
	$ /opt/edtm/bin/monice -v4kec -d majic-lt:e -l    (monice should
report connected)
	MON> ew 0xa003fffc =3
	MON> ew 0xa003fffc =2
	MON> ew 0xa0030000 =0xE34111BA
	MON> ew 0xa003fffc =0xa4444
	MON> ew 0xa003fffc =0
	MON> ew 0xa006f000 = 0x60000
	MON> l yamon.elf
	MON> l reset.elf
	Mon> g 

And that gives us a YAMON> prompt on the serial console of the 8634.
