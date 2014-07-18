Received: from mail-oa0-f53.google.com ([209.85.219.53]:61284 "EHLO
        mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861350AbaGRSOGq7Xdp (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 20:14:06 +0200
Received: by mail-oa0-f53.google.com with SMTP id j17so3850631oag.12
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 11:14:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALCETrUv3G+C3PTOD1FJGOG8AQCA30hNkUiusCnQDGq6Kt_Feg@mail.gmail.com>
References: <1405620518-18495-1-git-send-email-keescook@chromium.org>
        <alpine.LRH.2.11.1407181325200.15709@namei.org>
        <CALCETrUv3G+C3PTOD1FJGOG8AQCA30hNkUiusCnQDGq6Kt_Feg@mail.gmail.com>
Date: Fri, 18 Jul 2014 11:13:59 -0700
Message-ID: <CAGXu5jL9wQ4ZJ1kDRx_Y_cyGQEjO_Ugmcc--Q71x32_x1q9ScA@mail.gmail.com>
Subject: Re: [PATCH v12 11/11] seccomp: add thread sync ability
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Return-Path: <keescook@google.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Andy Lutomirski <luto@amacapital.net>
Cc: James Morris <jmorris@namei.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Morris <james.l.morris@oracle.com>, Oleg Nesterov <oleg@redhat.com>, David Drysdale <drysdale@google.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, Linux API <linux-api@vger.kernel.org>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140718181359.9naKonZMMMfQUq0hO-W3M8WOSBN9cC_jjay75963VGo@z>

On Fri, Jul 18, 2014 at 10:17 AM, Andy Lutomirski <luto@amacapital.net> wrote:
> On Thu, Jul 17, 2014 at 8:26 PM, James Morris <jmorris@namei.org> wrote:
>> On Thu, 17 Jul 2014, Kees Cook wrote:
>>
>>> Twelfth time's the charm! :)
>>
>> Btw, there doesn't seem to be an official seccomp maintainer.  Kees, would
>> you like to volunteer for this?  If so, send in a patch for MAINTAINERS,
>> and set up a git tree for me to pull from.

Sure thing, I'll get this set up now. I wonder if I should include the
glob "arch/*/kernel/ptrace.c" in the MAINTAINERS entry. :P

> *snicker* :)
>
> Kees, if you take on this awesome responsibility, should I send you a
> rebased version of the fastpath stuff?  If so, I think that the
> arch-neutral part should go in through your shiny new tree (once it's
> reviewed to your satisfaction), and I'll ask hpa to pick up the x86
> part.

Yeah, that sounds perfect.

> I'd volunteer to be a "R:eviewer", but I don't think that the R tag
> has made it into MAINTAINERS yet.

I'd love to have you listed. :)

-Kees

-- 
Kees Cook
Chrome OS Security
