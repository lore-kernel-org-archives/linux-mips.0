Received: from relay1.mentorg.com ([192.94.38.131]:53849 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6824820Ab3KEWgecvBCQ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Nov 2013 23:36:34 +0100
Date: Tue, 5 Nov 2013 22:36:24 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: Re: prlimit64: inconsistencies between kernel and userland
In-Reply-To: <52793C50.9030300@gmail.com>
Message-ID: <Pine.LNX.4.64.1311052234420.30260@digraph.polyomino.org.uk>
References: <20130628133835.GA21839@hall.aurel32.net> <20131104213756.GD18700@hall.aurel32.net>
 <20131104.194519.1657797548878784116.davem@davemloft.net>
 <Pine.LNX.4.64.1311050058580.9883@digraph.polyomino.org.uk>
 <20131105012203.GA24286@brightrain.aerifal.cx> <20131105085859.GE28240@mails.so.argh.org>
 <20131105183732.GB24286@brightrain.aerifal.cx> <52793C50.9030300@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <joseph_myers@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Rich Felker <dalias@aerifal.cx>, "Pinski, Andrew" <Andrew.Pinski@caviumnetworks.com>, Andreas Barth <aba@ayous.org>, David Miller <davem@davemloft.net>, aurelien@aurel32.net, linux-mips@linux-mips.org, libc-alpha@sourceware.org
Message-ID: <20131105223624.AogItg52f10Gt6vA589GjGSvQ5fOz_ndC_NSb0yIoug@z>

On Tue, 5 Nov 2013, David Daney wrote:

> Why can't the default version of the functions in question be fixed so that
> they do the right thing?  That way you wouldn't have to rebuild old binaries.
> 
> Do we really need new function versions at all?

If we change RLIM64_INFINITY to match the kernel, then the right thing for 
at least getrlimit64 depends on whether it's an old or new binary (for old 
binaries it should return the old value of RLIM64_INFINITY and for new 
ones it should return the new value).

-- 
Joseph S. Myers
joseph@codesourcery.com
