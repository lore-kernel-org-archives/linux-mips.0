Received: from mailapp01.imgtec.com ([195.59.15.196]:8079 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27010683AbaJGJNbBzWG6 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 7 Oct 2014 11:13:31 +0200
From: Matthew Fortune <Matthew.Fortune@imgtec.com>
Subject: RE: [PATCH resend] MIPS: Allow FPU emulator to use non-stack area.
Date: Tue, 7 Oct 2014 09:13:22 +0000
Message-ID: <6D39441BF12EF246A7ABCE6654B0235320F1E173@LEMAIL01.le.imgtec.org>
References: <1412627010-4311-1-git-send-email-ddaney.cavm@gmail.com>
 <20141006205459.GZ23797@brightrain.aerifal.cx>
 <5433071B.4050606@caviumnetworks.com>
 <20141006213101.GA23797@brightrain.aerifal.cx>
 <54330D79.80102@caviumnetworks.com>
 <20141006215813.GB23797@brightrain.aerifal.cx>
 <543327E7.4020608@amacapital.net> <54332A64.5020605@caviumnetworks.com>
 <20141007000514.GD23797@brightrain.aerifal.cx>
 <543334CE.8060305@caviumnetworks.com>
 <20141007004915.GF23797@brightrain.aerifal.cx> <54337127.40806@gmail.com>
In-Reply-To: <54337127.40806@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <Matthew.Fortune@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <david.s.daney@gmail.com>, Rich Felker <dalias@libc.org>, David Daney <ddaney@caviumnetworks.com>
Cc: Andy Lutomirski <luto@amacapital.net>, David Daney <ddaney.cavm@gmail.com>, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, David Daney <david.daney@cavium.com>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20141007091322.sMrAD8XaqUzQWx5OZXb7ewWoco4zuxOAn2L_fUZR5Qg@z>

> >> the out-of-line execution trick, but do it somewhere other than in
> >> stack memory.
> > How do you answer Andy Lutomirski's question about what happens when a
> > signal handler interrupts execution while the program counter is
> > pointing at this "out-of-line execution" trampoline? This seems like a
> > show-stopper for using anything other than the stack.
> It would be nice to support, but not doing so would not be a regression
> from current behavior.

It seems appropriate to mention another issue which should be addressed as
part of the overall FPU emulation work...
