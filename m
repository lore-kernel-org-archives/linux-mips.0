Received: from mail.baslerweb.com ([145.253.187.130]:3292 "EHLO
	mail.baslerweb.com") by ftp.linux-mips.org with ESMTP
	id S20037553AbXBEKjH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 5 Feb 2007 10:39:07 +0000
Received: (from smtpd@127.0.0.1) by mail.baslerweb.com (8.13.4/8.13.4)
	id l15AZvlH029069 for <linux-mips@linux-mips.org>; Mon, 5 Feb 2007 11:35:57 +0100
MIME-Version: 1.0
Date: Mon, 5 Feb 2007 11:35:55 +0100
Message-ID: <C5A8FDEFF7647F4C9CB927D7DEB3077303FCF2C9@ahr075s.basler.corp>
From: "Koeller, T." <Thomas.Koeller@baslerweb.com>
Subject: RE: [MIPS] Remove Basler Excite support
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: 8BIT
Return-Path: <Thomas.Koeller@baslerweb.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070205103555.aFepZtPmoDiyjuUwevIW4zV4U7SpSGh_EGtUPNVm340@z>

> From: linux-git-bounce@linux-mips.org 
> [mailto:linux-git-bounce@linux-mips.org] On Behalf Of 
> linux-mips@linux-mips.org
> Sent: Sunday, February 04, 2007 9:39 PM
> To: git-commits@linux-mips.org
> Subject: [MIPS] Remove Basler Excite support

Ralf,

the last time I worked on it (which is three days ago, while working to make the excite nand flash driver ready for submission), it built and ran just fine, so I really wonder why you are removing it. I now notice that it has been made depending on BROKEN some time ago, which escaped my attention when it happened.

The reason I did not encounter any build problems is that I always built the code with the yet-to-be-submitted drivers. The compilation error you get when building the excite platform is caused by a dependency upon the rm9k_serial driver, on which the platform depends for serial console support. I haven't yet managed to submit that driver, although I made several attempts. If serial console support were disabled, the code could trivially be fixed to compile without errors.

Can you revert the removal?

Thomas
_______________________________

Thomas Köller, Software Developer

Basler Vision Technologies
An der Strusbek 60-62
22926 Ahrensburg
Germany

Tel. +49 (0) 4102 - 463 390
Fax +49 (0) 4102 - 463 390

mailto:thomas.koeller@baslerweb.com
http://www.baslerweb.com

Vorstand: Dr.-Ing. Dietmar Ley (Vorsitzender) * John P. Jennings * Peter Krumhoff * Aufsichtsratsvorsitzender: Norbert Basler
Basler AG * Amtsgericht Ahrensburg HRB 4090 * Ust-IdNr.: DE 135 098 121 * Steuer-Nr.: 30 292 04497
