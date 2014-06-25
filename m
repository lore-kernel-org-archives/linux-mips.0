Received: from mail-qg0-f51.google.com ([209.85.192.51]:37306 "EHLO
        mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6859932AbaFYRzPkdb8L (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 25 Jun 2014 19:55:15 +0200
Received: by mail-qg0-f51.google.com with SMTP id z60so2014276qgd.10
        for <linux-mips@linux-mips.org>; Wed, 25 Jun 2014 10:55:09 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mtk.manpages@gmail.com
In-Reply-To: <CAGXu5j+99NOtJq2-TWYm8mwNw1ki0y3rRH21wX66MVM8=jz1bQ@mail.gmail.com>
References: <1403642893-23107-1-git-send-email-keescook@chromium.org>
 <20140624205615.GW5412@outflux.net> <20140625140440.6870eac1@alan.etchedpixels.co.uk>
 <CAGXu5j+99NOtJq2-TWYm8mwNw1ki0y3rRH21wX66MVM8=jz1bQ@mail.gmail.com>
From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Date: Wed, 25 Jun 2014 19:54:49 +0200
Message-ID: <CAKgNAkgU+igKYKtzk3u83ZTcR-ov7kq_J9mbTeHuOt7Zkbpy6Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] man-pages: seccomp.2: document syscall
Content-Type: text/plain; charset=UTF-8
Return-Path: <mtk.manpages@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kees Cook <keescook@chromium.org>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Oleg Nesterov <oleg@redhat.com>, Andy Lutomirski <luto@amacapital.net>, Alexei Starovoitov <ast@plumgrid.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <dborkman@redhat.com>, Will Drewry <wad@chromium.org>, Julien Tinnes <jln@chromium.org>, David Drysdale <drysdale@google.com>, Linux API <linux-api@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linux-arch <linux-arch@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>
Message-ID: <20140625175449.uuMigh0qy6HusL2YDYyTrrw0tvTselDzH8MTzxq_dfo@z>

On Wed, Jun 25, 2014 at 5:10 PM, Kees Cook <keescook@chromium.org> wrote:
> On Wed, Jun 25, 2014 at 6:04 AM, One Thousand Gnomes
> <gnomes@lxorguk.ukuu.org.uk> wrote:
>> On Tue, 24 Jun 2014 13:56:15 -0700
>> Kees Cook <keescook@chromium.org> wrote:
>>
>>> Combines documentation from prctl, in-kernel seccomp_filter.txt and
>>> dropper.c, along with details specific to the new syscall.
>>
>> What is the license on the example ? Probably you want to propogate the
>> minimal form of the text in seccomp/dropper into the document example to
>> avoid confusion ?
>
> What is the license of the other code examples in man-pages?

Typically, just the same as the rest if the page text. Perhaps that
should be rethought for future examples. I haven't thought about it at
length, but, at first glance, I'm not against having separate licenses
for the page text and the code sample.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
