Received: from smtp4.wanadoo.fr ([193.252.22.27]:18501 "EHLO smtp4.wanadoo.fr")
	by ftp.linux-mips.org with ESMTP id S8133462AbWBFII1 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 6 Feb 2006 08:08:27 +0000
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id DBF171C00313
	for <linux-mips@linux-mips.org>; Mon,  6 Feb 2006 09:13:53 +0100 (CET)
Subject: RE: [PATCH] Au1xx0: really set KSEG0 to uncached on reboot
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Date: Mon, 6 Feb 2006 09:10:37 +0100
Content-class: urn:content-classes:message
Message-ID: <17AB476A04B7C842887E0EB1F268111E027447@xpserver.intra.lexbox.org>
From: "David Sanchez" <david.sanchez@lexbox.fr>
Return-Path: <david.sanchez@lexbox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Sergei Shtylylov <sshtylyov@ru.mvista.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20060206081037.rIBFQ8Lj0PHqQ2MhaGI1ntaEklWbKs82ZuzJjkXFQj4@z>

Hi,

This is exactly what I did...
But I notice that sometimes it works and sometimes the kernel frees when 
"** Resetting Integrated Peripherals"

Regards,

David SANCHEZ
 LexBox, The Digital Evidence

Parc d'Activités de Basso Cambo
42, Avenue du Général de Croutte
31100 TOULOUSE / FRANCE

david.sanchez@lexbox.fr
Tél :     +33 (0)5 62 47 15 81
Fax :    +33 (0)5 62 47 15 84



-----Message d'origine-----
De : Sergei Shtylylov [mailto:sshtylyov@ru.mvista.com] 
Envoyé : samedi 4 février 2006 01:30
À : David Sanchez
Cc : linux-mips@linux-mips.org
Objet : Re: [PATCH] Au1xx0: really set KSEG0 to uncached on reboot

Hello.

David Sanchez wrote:

> The patch doesn't work for Au1550. Since I apply it my DbAu1550 frees on
> restart.

    Just tried 'reboot' command on a fresh kernel with this patch and NFP 
userland -- it worked well.

> David

WBR, Sergei
