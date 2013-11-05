Received: from mail-out.m-online.net ([212.18.0.10]:56552 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6823083Ab3KEXwYYgmbB (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 6 Nov 2013 00:52:24 +0100
From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: prlimit64: inconsistencies between kernel and userland
References: <20130628133835.GA21839@hall.aurel32.net>
        <20131104213756.GD18700@hall.aurel32.net>
        <20131104.194519.1657797548878784116.davem@davemloft.net>
        <Pine.LNX.4.64.1311050058580.9883@digraph.polyomino.org.uk>
        <20131105012203.GA24286@brightrain.aerifal.cx>
        <20131105085859.GE28240@mails.so.argh.org>
        <20131105183732.GB24286@brightrain.aerifal.cx>
        <52793C50.9030300@gmail.com>
        <Pine.LNX.4.64.1311052234420.30260@digraph.polyomino.org.uk>
        <20131105223953.GG24286@brightrain.aerifal.cx>
Date: Wed, 06 Nov 2013 00:52:14 +0100
In-Reply-To: <20131105223953.GG24286@brightrain.aerifal.cx> (Rich Felker's
        message of "Tue, 5 Nov 2013 17:39:53 -0500")
Message-ID: <87ppqez9sh.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <whitebox@nefkom.net>
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
Cc: "Joseph S. Myers" <joseph@codesourcery.com>, David Daney <ddaney.cavm@gmail.com>, "Pinski, Andrew" <Andrew.Pinski@caviumnetworks.com>, Andreas Barth <aba@ayous.org>, David Miller <davem@davemloft.net>, aurelien@aurel32.net, linux-mips@linux-mips.org, libc-alpha@sourceware.org
Message-ID: <20131105235214.RzNb4bbmhpi2gZ96cDgx0dm1_jGdvJgUXk-sU5xIKrk@z>

Rich Felker <dalias@aerifal.cx> writes:

> BTW, what happens on a distro where -dev packages are separate and the
> user compiles with old headers (not having upgraded the dev package)
> but new libc.so? :-)

The devel package must either be self-contained or require the matching
non-devel package.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
