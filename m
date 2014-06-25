Received: from mail-ob0-f174.google.com ([209.85.214.174]:57803 "EHLO
        mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859626AbaFYPKr53mRx (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 17:10:47 +0200
Received: by mail-ob0-f174.google.com with SMTP id va2so2218721obc.5
        for <linux-mips@linux-mips.org>; Wed, 25 Jun 2014 08:10:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140625140440.6870eac1@alan.etchedpixels.co.uk>
References: <1403642893-23107-1-git-send-email-keescook@chromium.org>
        <20140624205615.GW5412@outflux.net>
        <20140625140440.6870eac1@alan.etchedpixels.co.uk>
Date: Wed, 25 Jun 2014 08:10:41 -0700
Message-ID: <CAGXu5j+99NOtJq2-TWYm8mwNw1ki0y3rRH21wX66MVM8=jz1bQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] man-pages: seccomp.2: document syscall
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
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>, Oleg Nesterov <oleg@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Alexei Starovoitov <ast@plumgrid.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140625151041.eHxalkxp4OUx-89MgpNZL9IzJGGPguGVqRG77G6fYGA@z>

On Wed, Jun 25, 2014 at 6:04 AM, One Thousand Gnomes
<gnomes@lxorguk.ukuu.org.uk> wrote:
> On Tue, 24 Jun 2014 13:56:15 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> Combines documentation from prctl, in-kernel seccomp_filter.txt and
>> dropper.c, along with details specific to the new syscall.
>
> What is the license on the example ? Probably you want to propogate the
> minimal form of the text in seccomp/dropper into the document example to
> avoid confusion ?

What is the license of the other code examples in man-pages?

-Kees

-- 
Kees Cook
Chrome OS Security
