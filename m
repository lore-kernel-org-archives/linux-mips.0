Subject: Re: RAMDISK problem on 79s334A board.
Date: Wed, 15 May 2002 12:00:27 +0100 (BST)
In-Reply-To: <Pine.LNX.4.10.10205151403260.14414-100000@brahma.intotoind.com> from "Venkata Rajesh Bikkina" at May 15, 2002 02:12:25 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <E177wWB-0001df-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Sender: owner-linux-mips@oss.sgi.com
To: Venkata Rajesh Bikkina <rajeshbv@intotoinc.com>
Cc: linux-mips@oss.sgi.com
Message-ID: <20020515110027.Q46awv2fewGcAWTJCNk40hxTHMYVmaHmvvj9WdkhEco@z>

> But when i build RAMDISK image and insert the module, insmod is
> doing fine. But after that i could not invoke any other application ( even
> ps -ef is also giving segmentation fault.)

Looks like your module corrupts the kernel.
