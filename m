Content-class: urn:content-classes:message
Subject: vmalloc memory corruption
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Date: Tue, 4 Jan 2005 15:24:32 -0600
Message-ID: <8230E1CC35AF9F43839F3049E930169A0D89F9@yang.LibreStream.local>
From: "Christian Gan" <christian.gan@librestream.com>
Return-Path: <christian.gan@librestream.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050104212432.3nAp1SSSBQU226KHCcEvBRJOACeOBSxFw1imI0YxkLo@z>

Hey all,

I'm running into a strange memory corruption problem while trying to get
a driver to load firmware using hotplug support on a DBAU1550 eval
board.  This board has a single AU1550 MIPS32 processor.  I'm running
kernel version 2.6.10-rc3.

I've attached a code snippet below that I'd like somebody to try to
verify for me so I can determine whether or not it is a problem with my
kernel/hardware.  

The test code is a simplified version of the interaction between the
driver and the firmware/hotplug support of the kernel.  The firmware
hotplug support (linux/drivers/base/firmware_class.c) if fed data from a
file and places it into a buffer, this buffer gets reallocated when
required and grows as more data is read in.  Old data is memcopied into
the new reallocated buffer and newly read data is appended to the end.
What I'm finding is that eventually this data is corrupted.

Compile the test snippet below as a module and insmod it.  If things are
successful you should see results like this:

# insmod vmalloctest.ko
Using vmalloctest.ko
testing vmalloc
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09
...
0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09

But if data changes at any time, you've got problems like me.  When I
run this on my platform eventually the data becomes all 0x00.

Notice that if you use kmalloc instead of vmalloc (define USE_KMALLOC),
everything works.

Thanks!

Christian Gan

// Start vmalloctest.c

#ifndef __KERNEL__
#define __KERNEL__
#endif

#include <linux/config.h>
#include <linux/version.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/errno.h>
#include <linux/string.h>
#include <linux/mm.h>
#include <linux/delay.h>
#include <linux/init.h>
#include <linux/vmalloc.h>

#include <asm/io.h>

//#define USE_KMALLOC

void fillbuf(char * buf, unsigned long len)
{
	int i = 0;
	for (i = 0; i < len; i++)
	{
		buf[i] = 0xFF & i;
	}
}

int __init vmalloctest_init(void)
{
    char * buf = NULL;
	int i = 0;

	printk("testing vmalloc\n");
	
	for (i = 0; i < 50; i++)
	{
		int j = 0;
#ifndef USE_KMALLOC		
		char * newbuf = vmalloc( (i+1)*PAGE_SIZE );
// allocate a new buffer that grows in size
#else
		char * newbuf = kmalloc( (i+1)*PAGE_SIZE, GFP_KERNEL );
// allocate a new buffer that grows in size
#endif		
		if (!newbuf)
		{
			printk("Could not allocate memory: %ld bytes\n",
(i+1)*PAGE_SIZE);
			break;
		}
				
		if (i==0)
		{
			fillbuf(newbuf, PAGE_SIZE );		// fill
the original buffer with some data... any will suffice
		}
		else
		{
			memcpy(newbuf, buf, i*PAGE_SIZE);	// copy
the contents of the old buffer to the new	
		}
		
#ifndef USE_KMALLOC
		vfree(buf);		// free the old buffer
#else
		kfree(buf);		// free the old buffer
#endif		

		buf = newbuf;
		
		// print out the first few bytes
		for (j=0; j < 10; j++)
		{
			printk("0x%02X ", 0xff & buf[j]);
		}
		printk("\n");
	}

#ifndef USE_KMALLOC
	vfree(buf);
#else
	kfree(buf);
#endif		

	return 0;
}
module_init(vmalloctest_init);

MODULE_LICENSE("GPL");
