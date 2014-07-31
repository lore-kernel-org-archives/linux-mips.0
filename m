Received: from mail-la0-f51.google.com ([209.85.215.51]:55985 "EHLO
        mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6860192AbaGaSufqAwYP (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 31 Jul 2014 20:50:35 +0200
Received: by mail-la0-f51.google.com with SMTP id pn19so2377583lab.38
        for <linux-mips@linux-mips.org>; Thu, 31 Jul 2014 11:50:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140731184729.GA12296@localhost.localdomain>
References: <20140728173723.GA20993@redhat.com>
        <20140728185803.GA24663@redhat.com>
        <20140728192209.GA26017@localhost.localdomain>
        <20140729175414.GA3289@redhat.com>
        <20140730163516.GC18158@localhost.localdomain>
        <20140730174630.GA30862@redhat.com>
        <20140731003034.GA32078@localhost.localdomain>
        <20140731160353.GA14772@redhat.com>
        <20140731171329.GD7842@localhost.localdomain>
        <20140731181230.GA18695@redhat.com>
        <20140731184729.GA12296@localhost.localdomain>
Date: Thu, 31 Jul 2014 20:50:29 +0200
Message-ID: <CAFTL4hyHh3Bw0eeJe9q50HVrt=B-zgmyu6C_hy+RoW21kQEJtg@mail.gmail.com>
Subject: Re: TIF_NOHZ can escape nonhz mask? (Was: [PATCH v3 6/8] x86: Split
 syscall_trace_enter into two phases)
From: Frederic Weisbecker <fweisbec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <fweisbec@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Will Drewry <wad@chromium.org>, the arch/x86 maintainers <x86@kernel.org>, "<linux-arm-kernel@lists.infradead.org>" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>, Alexei Starovoitov <ast@plumgrid.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20140731185029.coTqENUz5WDpFypLxU9IY8QpFOYE4Tcq3EF_pfv7zhI@z>

2014-07-31 20:47 GMT+02:00 Frederic Weisbecker <fweisbec@gmail.com>:
> On Thu, Jul 31, 2014 at 08:12:30PM +0200, Oleg Nesterov wrote:
>> On 07/31, Frederic Weisbecker wrote:
> No, because preempt_schedule_irq() does the ctx_state save and restore with
> exception_enter/exception_exit.

Similar thing happens with schedule_user().

preempt_schedule_irq() handles kernel preemption and schedule_user()
the user preemption. On both cases we save and restore the context
tracking state.

This might be the missing piece you were missing :)
