Received: from relay1.mentorg.com ([192.94.38.131]:58357 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6823083Ab3KEXZZ0p3MJ (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 6 Nov 2013 00:25:25 +0100
Date: Tue, 5 Nov 2013 23:25:11 +0000
From: "Joseph S. Myers" <joseph@codesourcery.com>
Subject: Re: prlimit64: inconsistencies between kernel and userland
In-Reply-To: <20131105223953.GG24286@brightrain.aerifal.cx>
Message-ID: <Pine.LNX.4.64.1311052323180.30260@digraph.polyomino.org.uk>
References: <20130628133835.GA21839@hall.aurel32.net> <20131104213756.GD18700@hall.aurel32.net>
 <20131104.194519.1657797548878784116.davem@davemloft.net>
 <Pine.LNX.4.64.1311050058580.9883@digraph.polyomino.org.uk>
 <20131105012203.GA24286@brightrain.aerifal.cx> <20131105085859.GE28240@mails.so.argh.org>
 <20131105183732.GB24286@brightrain.aerifal.cx> <52793C50.9030300@gmail.com>
 <Pine.LNX.4.64.1311052234420.30260@digraph.polyomino.org.uk>
 <20131105223953.GG24286@brightrain.aerifal.cx>
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
To: Rich Felker <dalias@aerifal.cx>
Cc: David Daney <ddaney.cavm@gmail.com>, "Pinski, Andrew" <Andrew.Pinski@caviumnetworks.com>, Andreas Barth <aba@ayous.org>, David Miller <davem@davemloft.net>, aurelien@aurel32.net, linux-mips@linux-mips.org, libc-alpha@sourceware.org
Message-ID: <20131105232511.ipsYmQEHXznBdFYYOAJbMKLJzvquFDnUhWM5deFM6-0@z>

On Tue, 5 Nov 2013, Rich Felker wrote:

> On Tue, Nov 05, 2013 at 10:36:24PM +0000, Joseph S. Myers wrote:
> > On Tue, 5 Nov 2013, David Daney wrote:
> > 
> > > Why can't the default version of the functions in question be fixed so that
> > > they do the right thing?  That way you wouldn't have to rebuild old binaries.
> > > 
> > > Do we really need new function versions at all?
> > 
> > If we change RLIM64_INFINITY to match the kernel, then the right thing for 
> > at least getrlimit64 depends on whether it's an old or new binary (for old 
> > binaries it should return the old value of RLIM64_INFINITY and for new 
> > ones it should return the new value).
> 
> BTW, what happens on a distro where -dev packages are separate and the
> user compiles with old headers (not having upgraded the dev package)
> but new libc.so? :-)

That's a bug in the distribution packaging that it allows such 
inconsistent versions.  glibc only supports the case when the static-link 
stage happens against the same glibc version as the headers that were used 
(static libraries built with old headers are expected to break whenever 
there's some ABI change made through symbol versioning).

-- 
Joseph S. Myers
joseph@codesourcery.com
