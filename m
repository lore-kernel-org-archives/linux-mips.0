Message-ID: <400BB003.8000605@mvista.com>
Date: Mon, 19 Jan 2004 02:22:59 -0800
From: Pete Popov <ppopov@mvista.com>
MIME-Version: 1.0
Subject: Re: au1100 usb support
References: <200401191806.27381.bob@diamond.demon.co.uk>
In-Reply-To: <200401191806.27381.bob@diamond.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <ppopov@mvista.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Bob Lees <bob@diamond.demon.co.uk>
Cc: linux-mips@linux-mips.org
Message-ID: <20040119102259.wIiQiSQEbpunx4Hgfm1URhumqEVYgser3biOdRU9M3s@z>

Bob Lees wrote:

>OK I'm missing something somewhere
>
>I am trying to get the usb host controller to work on an AU1100 board (the 
>Aurora board from DSP Design) and it isn't initialising the host controller.
>
From looking at the usb host code it appears that the only interface supported 
>is via pci, but this processor/board doesn't have pci.
>
>A previous kernel based on 2.4.17 had the concept of CONFIG_USB_NON_PCI_OHCI 
>which appears to have disappeared.  This generated a pseudo pci interface.
>
>Help, any idea where I should be looking.
>  
>
I assume you're working with the linux-mips.org kernel?  Take a look at 
the readme at ftp.linux-mips.org:/pub/linux/mips/people/ppopov.  You're 
missing the usb non-pci patch.

Pete
