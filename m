Subject: Re: limited Memory question...
Date: Wed, 9 Jan 2002 03:13:40 +0000 (GMT)
In-Reply-To: <003301c198af$1c0d0a80$9b6e0b0a@huawei.com> from "machael thailer" at Jan 09, 2002 09:43:59 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E16O9BM-0008W9-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: machael thailer <dony.he@huawei.com>
Cc: linux-mips@oss.sgi.com, Ralf Baechle <ralf@oss.sgi.com>
Message-ID: <20020109031340.mXeZvChBYGHMHFBKHuaxjQDh0S8tx74M6JBP0_znn6A@z>

>     I have a question to need you help. Our MIPS-based custom board has only
> 8M memory.When I want to insmod a 24M module, it often panics and says "out 
> of memory...".
> How can I solve this?

Stop the module using 24Mb of unpageable memory ?
