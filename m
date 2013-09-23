Received: from mail-bk0-f52.google.com ([209.85.214.52]:44690 "EHLO
        mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S6817315Ab3IWIhcC3Sy6 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Sep 2013 10:37:32 +0200
Date: Mon, 23 Sep 2013 10:36:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 07/10] of/irq: Propagate errors in
 of_irq_to_resource_table()
Message-ID: <20130923083605.GC11881@ulmo>
References: <1379510692-32435-1-git-send-email-treding@nvidia.com>
 <1379510692-32435-8-git-send-email-treding@nvidia.com>
 <CAL_JsqJ+4P26hRrJcrbBmwfNPDAS+1GhXj12B+UvqmZZGjqT0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ+4P26hRrJcrbBmwfNPDAS+1GhXj12B+UvqmZZGjqT0g@mail.gmail.com>
Return-Path: <thierry.reding@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robherring2@gmail.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ralf Baechle <ralf@linux-mips.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mips@linux-mips.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20130923083606.1X3Ca6FWsbWgpbJ9usUpr9g7rpJp4f8g_Mfcko8pM1g@z>


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 22, 2013 at 04:08:26PM -0500, Rob Herring wrote:
> On Wed, Sep 18, 2013 at 8:24 AM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > Now that all helpers return precise error codes, this function can
> > propagate these errors to the caller properly.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v2:
> > - return 0 on success or a negative error code on failure
> > - convert callers to new calling convention
>=20
> [snip]
>=20
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index e4f38c0..6d7f824 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -397,18 +397,20 @@ int of_irq_count(struct device_node *dev)
> >   * @res: array of resources to fill in
> >   * @nr_irqs: the number of IRQs (and upper bound for num of @res eleme=
nts)
>=20
> You are effectively changing this to require an exact match rather
> than an upper bound. That seems to be okay since that is what all the
> callers want, but the documentation should be updated.

Done.

> >   *
> > - * Returns the size of the filled in table (up to @nr_irqs).
> > + * Returns 0 on success or a negative error code on failure.
> >   */
> >  int of_irq_to_resource_table(struct device_node *dev, struct resource =
*res,
> >                 int nr_irqs)
> >  {
> > -       int i;
> > +       int i, ret;
> >
> > -       for (i =3D 0; i < nr_irqs; i++, res++)
> > -               if (!of_irq_to_resource(dev, i, res))
>=20
> The error handling here needs to be updated in the previous patch.

Yes, you're right.

Thanks,
Thierry

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSP/11AAoJEN0jrNd/PrOh9SkP/0eqpECG/DCrq/PRvyVz1O5b
HRQn8Z6vwNDHfFBuxndtGEyyp28LmnxqIsFkooksR+VP/ZPnvcL68Db8p7ta3r2l
9AK8X2uESqu8/zIsqYHM0bjNICoVmwlRfuEUKkMXbta5j2jVH+Z6cgBcf2rhd7Dm
GAXRuRdnvrRy43GwUS0WzGYWH/zeihR1lI/dzPjaW4AYmfb8PSB43+sHV+Cev5j+
mldi6zYZa9N+ozEEhD4yY7hhGr5epkLypKFN4ihms9NUuPdBs/vZN1MBc+01PlTd
Etmy0NfoZDc/0yV+cQczelQ4dweAWFt+7mqNVpPtYWSLY4TiVqMqhTjXHmV8A1lV
1TMvhzABTRuTqQt9AvKkeFuarNRqBMp5CKLlHYhYJ9ggiXlA8G3xUAUaNoNQqeVG
OmoMFLpHzfntFyv8k5+WSi5L/aukFh0UPaVk4/O68IK3tfh+cGOGptgszLV2k2Aw
nKn8xPq3K7ByyEF5F1wmzceSNCiFm8irFVhKWWAIk8HIBHAs5hw1nqPQsscmcIDT
63AHK92IqEQo+YwO63Z7S8PFgZ3JSl+1LpzpjjP9v68B+UI9jQiaJaQ4sD3CP4L5
cdF6MYLhPjxwsFY4LkZWRjFBopaI7+l8XMjkobiKed9cQKJyg2DuJAEu19nRMP8s
txsDsmA/HZfN7bgreMBW
=bK7L
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
