From: Keith Owens <kaos@melbourne.sgi.com>
Subject: Re: Kernel crash on boot with current cvs (todays) 
In-reply-to: Your message of "Wed, 13 Jun 2001 13:37:51 +0200."
             <20010613133751.A18749@bunny.shuttle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Jun 2001 21:46:20 +1000
Message-ID: <8067.992432780@ocs4.ocs-net>
Sender: owner-linux-mips@oss.sgi.com
To: Raoul Borenius <borenius@shuttle.de>
Cc: Florian Lohoff <flo@rfc822.org>, Ralf Baechle <ralf@oss.sgi.com>, linux-mips@oss.sgi.com
Message-ID: <20010613114620.ml-5hxkMb87WePwV8R6RHGIyecfe5Mveh5_RZBz7VBc@z>

On Wed, 13 Jun 2001 13:37:51 +0200, 
borenius@shuttle.de (Raoul Borenius) wrote:
>Unable to handle kernel paging request at virtual address 00000000, epc == 8800e                               e5c, ra == 8800ee5c
>Call Trace: [<88124dc0>] [<88124dd8>] [<8800eb84>] [<88063810>] [<880647f4>] [<8                               8063670>] [<880640f0>] [<880640b8>] [<8805f7f4>] [<88052a88>] [<88052b74>] [<880
>537c0>] [<88053768>] [<88052294>] [<8804ef14>] [<8800fc28>] [<8800c638>] [<c013d                               686>]

The epc line and the call trace have embedded spaces and newlines which
are preventing ksymoops from doing a full conversion.  Try again with
the extra characters removed, i.e.

Unable to handle kernel paging request at virtual address 00000000, epc == 8800e5c, ra == 8800ee5c
....
Call Trace: [<88124dc0>] [<88124dd8>] [<8800eb84>] [<88063810>]
[<880647f4>] [<88063670>] [<880640f0>] [<880640b8>] [<8805f7f4>]
[<88052a88>] [<88052b74>] [<880537c0>] [<88053768>] [<88052294>]
[<8804ef14>] [<8800fc28>] [<8800c638>] [<c013d686>]
Code: ...
