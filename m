Received: from gateway09.websitewelcome.com ([67.18.14.9]:50725 "EHLO
        gateway09.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6821443AbaEZW6Fxt29- (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 27 May 2014 00:58:05 +0200
Received: from gator3163.hostgator.com (gator3163.hostgator.com [50.87.144.199])
        by gateway09.websitewelcome.com (Postfix) with ESMTP id 04A6575A916F6
        for <linux-mips@linux-mips.org>; Mon, 26 May 2014 17:58:02 -0500 (CDT)
Received: from [98.234.48.184] (port=52665 helo=[10.0.0.13])
        by gator3163.hostgator.com with esmtpa (Exim 4.82)
        (envelope-from <kevink@paralogos.com>)
        id 1Wp3qD-0005gN-Hr
        for linux-mips@linux-mips.org; Mon, 26 May 2014 17:58:01 -0500
Message-ID: <5383C6DD.4090107@paralogos.com>
Date: Mon, 26 May 2014 15:57:33 -0700
From: "Kevin D. Kissell" <kevink@paralogos.com>
MIME-Version: 1.0
Subject: Re: 1004K MT paging issue
References: <498838AF-48B0-4244-95C0-F590040E5E08@axis.com>
In-Reply-To: <498838AF-48B0-4244-95C0-F590040E5E08@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@paralogos.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org

When a VPE hits an exception and sets EXL, thread scheduling stops and
the VPE is single-threaded coming into the exception.  With dual VPEs,
one of them hitting a fault won't prevent another from doing so, but all
the usual rules of locking and ordering that are needed for any SMP
kernel should apply and "just work".  Is there any SMP support in the VM
subsystem that's conditionally modfied or excluded for your 1004K kernel
build?

/K.


On 5/26/2014 1:56 PM, Mikael Starvik wrote:
> Hi!
>
> We have a 1004K core with two VPEs with two TCs per VPE. We have a problem that is hard to debug and would like to know if anyone has seen or solved such an issue.
>
> A multithreaded application is running. 
> Twoapplication threads are running in one TC each on the same VPE.
> A piece of code has been paged out.
> Application thread 1 tries to execute the code and thus gets a page fault.
> While the page fault is being handled the second application thread enters the same code.
> For some reason it looks like application thread 2 is allowed to execute even if the page fault handling has not been finished yet.
> Thread 2 executes the wrong code and typically gets a reserved instruction exception.
>
> Any thougts?
>
> BR
> /Mikael
