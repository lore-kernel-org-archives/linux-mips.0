Return-Path: <SRS0=tExh=BE=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05924C433DF
	for <linux-mips@archiver.kernel.org>; Sat, 25 Jul 2020 06:49:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D510E2070E
	for <linux-mips@archiver.kernel.org>; Sat, 25 Jul 2020 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595659765;
	bh=aHCWn/NHNHRr3LmuNH2RgZv/xWHN8VnwuRR+oQFW0ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q6H46QnWbhuFCyb+fY2chjJECRX0tx1qgyJIiJ5tqNvjmrVF1pjAsKsAwCsmBKbI4
	 CS+eIz+tIM7aQHvDS3KEsEAXF9ct+V3H+N8Id0e6Yweo+uMjnosx5j3JHlnJRL38Pg
	 1tdLnwWGwk2WPVbjBwkKhHOKuiIVexvC6XGaCn/E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgGYGtZ (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sat, 25 Jul 2020 02:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgGYGtY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Jul 2020 02:49:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BB8420663;
        Sat, 25 Jul 2020 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595659763;
        bh=aHCWn/NHNHRr3LmuNH2RgZv/xWHN8VnwuRR+oQFW0ew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wLUeglOu6GUi2p+Yl9pYztuGakGl23r2pMZKd6yZPn1GkJgxP/fHGm369Li56gJCn
         VhW2H1qom7tZf8qvNRQIlbh2TbANum8NEWG5en92XtZfUDDehtYomm0OvBpoZE5lgE
         gWCBRvbnbitxbc3yTpk2/uWX3rMz5bceCdyJWcns=
Date:   Sat, 25 Jul 2020 08:49:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH V2] MIPS: CPU#0 is not hotpluggable
Message-ID: <20200725064923.GA1059787@kroah.com>
References: <1594896024-16624-1-git-send-email-chenhc@lemote.com>
 <CAAhV-H4QH-cyabcfYyNJv89LpOdpsXN+dpZBYy0gNKmSnsUsKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4QH-cyabcfYyNJv89LpOdpsXN+dpZBYy0gNKmSnsUsKA@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jul 25, 2020 at 02:37:52PM +0800, Huacai Chen wrote:
> Hi, Thomas,
> 
> What do you think about this patch? Other archs also do the same thing
> except those support hotplug CPU#0.
> 
> grep hotpluggable arch -rwI
> arch/riscv/kernel/setup.c:        cpu->hotpluggable = cpu_has_hotplug(i);
> arch/powerpc/kernel/sysfs.c:    BUG_ON(!c->hotpluggable);
> arch/powerpc/kernel/sysfs.c:            c->hotpluggable = 1;
> arch/powerpc/kernel/sysfs.c:        if (cpu_online(cpu) || c->hotpluggable) {
> arch/arm/kernel/setup.c:        cpuinfo->cpu.hotpluggable =
> platform_can_hotplug_cpu(cpu);
> arch/sh/kernel/topology.c:        c->hotpluggable = 1;
> arch/ia64/kernel/topology.c:     * CPEI target, then it is hotpluggable
> arch/ia64/kernel/topology.c:        sysfs_cpus[num].cpu.hotpluggable = 1;
> arch/xtensa/kernel/setup.c:        cpu->hotpluggable = !!i;
> arch/s390/kernel/smp.c:    c->hotpluggable = 1;
> arch/mips/kernel/topology.c:        c->hotpluggable = 1;
> arch/arm64/kernel/cpuinfo.c: * In case the boot CPU is hotpluggable,
> we record its initial state and
> arch/arm64/kernel/setup.c:        cpu->hotpluggable = cpu_can_disable(i);
> arch/x86/kernel/topology.c:        per_cpu(cpu_devices,
> num).cpu.hotpluggable = 1;
> 
> On Thu, Jul 16, 2020 at 6:38 PM Huacai Chen <chenhc@lemote.com> wrote:
> >
> > Now CPU#0 is not hotpluggable on MIPS, so prevent to create /sys/devices
> > /system/cpu/cpu0/online which confuses some user-space tools.

What userspace tools are confused by this?  They should be able to
handle a cpu not being able to be removed, right?


> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/kernel/topology.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/kernel/topology.c b/arch/mips/kernel/topology.c
> > index cd3e1f8..08ad637 100644
> > --- a/arch/mips/kernel/topology.c
> > +++ b/arch/mips/kernel/topology.c
> > @@ -20,7 +20,7 @@ static int __init topology_init(void)
> >         for_each_present_cpu(i) {
> >                 struct cpu *c = &per_cpu(cpu_devices, i);
> >
> > -               c->hotpluggable = 1;
> > +               c->hotpluggable = !!i;

Seems to be the same as what xtensa did, so it's probably not a big
deal.

thanks,

greg k-h
