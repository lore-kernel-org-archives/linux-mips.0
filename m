Received: from mail-pd0-f179.google.com ([209.85.192.179]:59685 "EHLO
        mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6824758Ab3HSTTkvdJz0 convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Mon, 19 Aug 2013 21:19:40 +0200
Received: by mail-pd0-f179.google.com with SMTP id v10so5690405pde.10
        for <linux-mips@linux-mips.org>; Mon, 19 Aug 2013 12:19:34 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
From: Mike Turquette <mturquette@linaro.org>
In-Reply-To: <52125E31.6090207@samsung.com>
References: <1375804317-10576-1-git-send-email-s.nawrocki@samsung.com>
 <1375804317-10576-3-git-send-email-s.nawrocki@samsung.com>
 <20130816214841.4443.10515@quantum> <52125E31.6090207@samsung.com>
Message-ID: <20130819191928.4443.47862@quantum>
Subject: Re: [PATCH RFC 2/2] clk: implement clk_unregister
Date: Mon, 19 Aug 2013 12:19:28 -0700
Return-Path: <mturquette@linaro.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, jiada_wang@mentor.com, broonie@kernel.org, vapier@gentoo.org, ralf@linux-mips.org, lethal@linux-sh.org, kyungmin.park@samsung.com, shawn.guo@linaro.org, sebastian.hesselbarth@gmail.com, LW@KARO-electronics.de, t.figa@samsung.com, g.liakhovetski@gmx.de, laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org
Message-ID: <20130819191928.Ie2XRugtohITFtJnDa8g7wCR_hdbgxH_0aHP_LyyNdA@z>

Quoting Sylwester Nawrocki (2013-08-19 11:04:33)
> On 08/16/2013 11:48 PM, Mike Turquette wrote:
> > Quoting Sylwester Nawrocki (2013-08-06 08:51:57)
> >> +/*
> >> + * Empty clk_ops for unregistered clocks. These are used temporarily
> >> + * after clk_unregister() was called on a clock and until last clock
> >> + * consumer calls clk_put() and the struct clk object is freed.
> >> + */
> >> +static int clk_dummy_prepare_enable(struct clk_hw *hw)
> >> +{
> >> +       return -ENXIO;
> >> +}
> >> +
> >> +static void clk_dummy_disable_unprepare(struct clk_hw *hw)
> >> +{
> >> +       WARN_ON(1);
> >> +}
> >> +
> >> +static int clk_dummy_set_rate(struct clk_hw *hw, unsigned long rate,
> >> +                                       unsigned long parent_rate)
> >> +{
> >> +       return -ENXIO;
> >> +}
> >> +
> >> +static int clk_dummy_set_parent(struct clk_hw *hw, u8 index)
> >> +{
> >> +       return -ENXIO;
> >> +}
> >> +
> >> +static const struct clk_ops clk_dummy_ops = {
> >> +       .enable         = clk_dummy_prepare_enable,
> >> +       .disable        = clk_dummy_disable_unprepare,
> >> +       .prepare        = clk_dummy_prepare_enable,
> >> +       .unprepare      = clk_dummy_disable_unprepare,
> >> +       .set_rate       = clk_dummy_set_rate,
> >> +       .set_parent     = clk_dummy_set_parent,
> >> +};
> > 
> > Don't use "clk_dummy_*" here. The use of dummy often implies that
> > operations will return success in the absence of actual hardware but
> > these return an error, and rightly so. So maybe rename the functions and
> > clk_ops instance to something like "clk_nodev_*" or "clk_missing_*"?
> 
> Hmm, this is more about a driver being removed rather than the device.
> Then perhaps we could make it __clk_nodrv_* or clk_nodrv_* ?

clk_nodrv_* sounds good.

> 
> >>  /**
> >>   * clk_unregister - unregister a currently registered clock
> >>   * @clk: clock to unregister
> >> - *
> >> - * Currently unimplemented.
> >>   */
> >> -void clk_unregister(struct clk *clk) {}
> >> +void clk_unregister(struct clk *clk)
> >> +{
> >> +       unsigned long flags;
> >> +
> >> +       clk_prepare_lock();
> >> +
> >> +       if (!clk || IS_ERR(clk)) {
> >> +               pr_err("%s: invalid clock: %p\n", __func__, clk);
> >> +               goto out;
> >> +       }
> >> +
> >> +       if (clk->ops == &clk_dummy_ops) {
> >> +               pr_err("%s: unregistered clock: %s\n", __func__, clk->name);
> >> +               goto out;
> >> +       }
> >> +       /*
> >> +        * Assign dummy clock ops for consumers that might still hold
> >> +        * a reference to this clock.
> >> +        */
> >> +       flags = clk_enable_lock();
> >> +       clk->ops = &clk_dummy_ops;
> >> +       clk_enable_unlock(flags);
> >> +
> >> +       if (!hlist_empty(&clk->children)) {
> >> +               struct clk *child;
> >> +
> >> +               /* Reparent all children to the orphan list. */
> >> +               hlist_for_each_entry(child, &clk->children, child_node)
> >> +                       clk_set_parent(child, NULL);
> >> +       }
> > 
> > This looks pretty good. A remaining problem is re-loading the clock
> > provider module will have string name conflicts with the old
> > unregistered clocks (but not yet released) clocks during calls to
> > __clk_lookup.
> 
> But the clock is being dropped from the clock tree immediately in this
> function. After the hlist_del_init() call below the clock is not present
> on any clocks list. Upon clock release only the memory allocated for
> the clock is freed.

You are correct. Not sure why I thought that the clock being
unregistered was also getting pushed to the orphan list.

> 
> > The best solution would be to refactor clk.c to not use string name
> > lookups but that is probably too big of an issue for the purpose of this
> > series (but it will happen some day).
> > 
> > A short term solution would be to poison the clock's string name here.
> > Reallocate the clk->name string with some poison data so that name
> > conflicts don't occur. What do you think?
> 
> This shouldn't be necessary, for the reason described above. I've tested
> multiple registrations when a clock was being referenced by a consumer
> driver and it worked well.
> 
> I'm still a bit unsure about the kref reference counting, but I'd would
> assume it is good to have. It prevents the kernel to crash in some
> situations. Many other subsystems/drivers crash miserably when a driver
> gets unbound using the sysfs "unbind" attribute. However, if it is assumed
> that user space needs to keep track of respective resource references
> and should know what it does when unbinding drivers, then we could probably
> do without the kref. I'm seriously sceptical though about letting user
> space to crash the kernel in fairly simple steps, it just doesn't sound
> right.

Let's leave the kref bits in. If we can prove that they are unnecessary
in the future then they can always be removed.

This series looks good, barring the s/dummy/no_drv/ rename.  Russell's
ACK is needed for patch #1.

Regards,
Mike

> 
> > Regards,
> > Mike
> > 
> >> +
> >> +       clk_debug_unregister(clk);
> >> +
> >> +       hlist_del_init(&clk->child_node);
> >> +
> >> +       if (clk->prepare_count)
> >> +               pr_warn("%s: unregistering prepared clock: %s\n",
> >> +                                       __func__, clk->name);
> >> +
> >> +       kref_put(&clk->ref, __clk_release);
> >> +out:
> >> +       clk_prepare_unlock();
> >> +}
> >>  EXPORT_SYMBOL_GPL(clk_unregister);
> >>
> >>  static void devm_clk_release(struct device *dev, void *res)
> >> @@ -1861,6 +1973,7 @@ int __clk_get(struct clk *clk)
> >>         if (!try_module_get(clk->owner))
> >>                 return 0;
> >>
> >> +       kref_get(&clk->ref);
> >>         return 1;
> >>  }
> >>  EXPORT_SYMBOL(__clk_get);
> >> @@ -1870,6 +1983,10 @@ void __clk_put(struct clk *clk)
> >>         if (!clk || IS_ERR(clk))
> >>                 return;
> >>
> >> +       clk_prepare_lock();
> >> +       kref_put(&clk->ref, __clk_release);
> >> +       clk_prepare_unlock();
> >> +
> >>         module_put(clk->owner);
> >>  }
> >>  EXPORT_SYMBOL(__clk_put);
> 
> --
> Regards,
> Sylwester
