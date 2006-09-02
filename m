Received: from mail.zeugmasystems.com ([192.139.122.66]:57432 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20038659AbWIBAuN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sat, 2 Sep 2006 01:50:13 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: early_initcall
Date: Fri, 1 Sep 2006 17:50:06 -0700
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D366028@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060902005006.vEobf7oesS1jAWfMtgCuFIGgFf6L71gocM3kXVPt2_E@z>

 
> Ashlesha Shintre wrote:
> 
> Hi,
> 
> I m using the 2.6.14.6 tree and trying to get the kernel 
> running on the
> Encore M3 board.  
> 
> The kernel crashes during the boot process at the 
> early_initcall.

What is the exact output from the crash?

> This function doesnt seem to be defined anywhere.

It's not a function, but a macro. The macro is used to annotate a
function as being among the list of functions that are called at startup
by the "initcall" mechanism: a big loop that sweeps over a symbol table
of registered initialization functions and calls them. E.g.

  #include <linux/init.h>

  /* ... */

  int __init my_initialization_function(void)
  {
    printk(KERN_INFO "Hello, world\n");
  }

  early_initcall(my_initialization_function);

The __init tells the kernel build system that your function is not
needed after initialization and its memory can be thrown away. The
early_initcall arranges for the initialization call. Early means that
it's in the first group of functions.

If you suspect your kernel is dying during the calling of the initcall
functions, you can turn on initcall debugging. Add these parameters to
your kernel command line:

   debug debug_initcall

Hope this helps.
