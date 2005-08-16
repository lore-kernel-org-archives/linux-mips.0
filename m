Subject: DB AU1550 and safeXcel DMA burst problem
Date: Tue, 16 Aug 2005 11:11:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Message-ID: <17AB476A04B7C842887E0EB1F268111E026ED5@xpserver.intra.lexbox.org>
Content-class: urn:content-classes:message
From: "David Sanchez" <david.sanchez@lexbox.fr>
Return-Path: <david.sanchez@lexbox.fr>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050816091140.aqwlnFrPJY66NtxXkSfhACZsfo3wcBRBPgTXkHrbo84@z>

Hi, 

I'm using the Security Engine of the DB AU1550 to compute SHA1 on files.

All is working fine but if I use a DMA burst greater than 8 words the
resulting SHA1 is incorrect !

Do you have the same behaviour ? Do you have an explanation of such a
behaviour ? Is it a HW bug ?

Thanks,

David
