Received: from mail-it0-x233.google.com ([IPv6:2607:f8b0:4001:c0b::233]:37309
        "EHLO mail-it0-x233.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23993869AbdDGDWAsB0G4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 7 Apr 2017 05:22:00 +0200
Received: by mail-it0-x233.google.com with SMTP id a140so36847149ita.0
        for <linux-mips@linux-mips.org>; Thu, 06 Apr 2017 20:22:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvbtzztb.fsf@intel.com>
References: <20170405214711.GA5711@beast> <87mvbtzztb.fsf@intel.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Apr 2017 20:21:54 -0700
Message-ID: <CAGXu5j+ms4KMy1Uh473r+2veTKnuHN4OuozS92WWwnycH-LGLw@mail.gmail.com>
Subject: Re: [PATCH] format-security: move static strings to const
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
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, "Maciej W. Rozycki" <macro@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jes Sorensen <jes@trained-monkey.org>, Jiri Slaby <jslaby@suse.com>, Patrice Chotard <patrice.chotard@st.com>, "David S. Miller" <davem@davemloft.net>, James Hogan <james.hogan@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Mugunthan V N <mugunthanvnm@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Jarod Wilson <jarod@redhat.com>, Florian Westphal <fw@strlen.de>, Antonio Quartulli <a@unstable.cc>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kejian Yan <yankejian@huawei.com>, Daode Huang <huangdaode@hisilicon.com>, Philippe Reynes <tremyfr@gmail.com>, Colin Ian King <colin.king@canonical.com>, Eric Dumazet <edumazet@google.com>, Christian Gromm <christian.gromm@microchip.com>, Andrey Shvetsov <andrey.shvetsov@k2l.de>, Jason Litzinger <jlitzingerdev@gmail.com>, WANG Cong <xiyou.wangcong@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-omap@vger.kernel.org, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Linux PM list <linux-pm@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Network Development <netdev@vger.kernel.org>, devel@driverdev.osuosl.org, linux-serial@vger.kernel.org, linux-decnet-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Message-ID: <20170407032154.9cOg8CVSSe-Ten9lYdDkVYWh61X6zsuKFHklGcjM6Ew@z>

On Thu, Apr 6, 2017 at 1:48 AM, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 06 Apr 2017, Kees Cook <keescook@chromium.org> wrote:
>> While examining output from trial builds with -Wformat-security enabled,
>> many strings were found that should be defined as "const", or as a char
>> array instead of char pointer. This makes some static analysis easier,
>> by producing fewer false positives.
>>
>> As these are all trivial changes, it seemed best to put them all in
>> a single patch rather than chopping them up per maintainer.
>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index f6d4d9700734..1ff9d5912b83 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2331,7 +2331,7 @@ EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
>>  int __init drm_fb_helper_modinit(void)
>>  {
>>  #if defined(CONFIG_FRAMEBUFFER_CONSOLE_MODULE) && !defined(CONFIG_EXPERT)
>> -     const char *name = "fbcon";
>> +     const char name[] = "fbcon";
>
> I'd always write the former out of habit. Why should I start using the
> latter? What makes it better?

For me, it's mainly two reasons: sizeof() and -Wformat-security behavior.

The compiler treats "sizeof" differently. E.g. "sizeof(var)" shows the
allocation size for the array, and pointer size for the char pointer.
When doing things like snprintf(buf, sizeof(buf), ...) will do the
right thing, etc. (This is a poor example for a _const_ string, but
the point is that some calculations still work better with the array
over the pointer.)

The other situation (which is why I noted this to change them) is that
gcc's handling of them is different when faced with -Wformat-security
since it doesn't like to believe that const char pointers are actually
const for the purposes of being a format string.

> What keeps the kernel from accumulating tons more of the former?

Right now, nothing. The good news is that they're relatively rare, and
I notice them when they're added (since I have a -Wformat-security
tree). We could add a warning to checkpatch for suggesting const char
var[] over const char *var, perhaps?

> Here's an interesting comparison of the generated code. I'm a bit
> surprised by what gcc does, I would have expected no difference, like
> clang. https://godbolt.org/g/OdqUvN

Here's your example with sizeof() added, if you're curious...
https://godbolt.org/g/U1zIZK

> The other changes adding const in this patch are, of course, good.

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
