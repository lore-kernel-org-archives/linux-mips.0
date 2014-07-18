Received: from mail-la0-f46.google.com ([209.85.215.46]:55518 "EHLO
        mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6861349AbaGRRRcMTOA8 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Jul 2014 19:17:32 +0200
Received: by mail-la0-f46.google.com with SMTP id b8so3134161lan.33
        for <linux-mips@linux-mips.org>; Fri, 18 Jul 2014 10:17:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1407181325200.15709@namei.org>
References: <1405620518-18495-1-git-send-email-keescook@chromium.org> <alpine.LRH.2.11.1407181325200.15709@namei.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 18 Jul 2014 10:17:06 -0700
Message-ID: <CALCETrUv3G+C3PTOD1FJGOG8AQCA30hNkUiusCnQDGq6Kt_Feg@mail.gmail.com>
Subject: Re: [PATCH v12 11/11] seccomp: add thread sync ability
Content-Type: text/plain; charset=UTF-8
Return-Path: <luto@amacapital.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Morris <jmorris@namei.org>
Cc: Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Morris <james.l.morris@oracle.com>, Oleg Nesterov <oleg@redhat.com>, David Drysdale <drysdale@google.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, Linux API <linux-api@vger.kernel.org>, X86 ML <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, linux-arch <linux-arch@vger.kernel.org>, LSM List <linux-security-module@vger.kernel.org>
Message-ID: <20140718171706.KEhjVUy53Yicamvz7tThpqc03-I0O_H3s8pfp6B35as@z>

On Thu, Jul 17, 2014 at 8:26 PM, James Morris <jmorris@namei.org> wrote:
> On Thu, 17 Jul 2014, Kees Cook wrote:
>
>> Twelfth time's the charm! :)
>
> Btw, there doesn't seem to be an official seccomp maintainer.  Kees, would
> you like to volunteer for this?  If so, send in a patch for MAINTAINERS,
> and set up a git tree for me to pull from.

*snicker* :)

Kees, if you take on this awesome responsibility, should I send you a
rebased version of the fastpath stuff?  If so, I think that the
arch-neutral part should go in through your shiny new tree (once it's
reviewed to your satisfaction), and I'll ask hpa to pick up the x86
part.

I'd volunteer to be a "R:eviewer", but I don't think that the R tag
has made it into MAINTAINERS yet.

--Andy
