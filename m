Received: from mail-pa0-f66.google.com ([209.85.220.66]:33276 "EHLO
        mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23992685AbcHIBo2EMD4y convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 9 Aug 2016 03:44:28 +0200
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/4] MIPS: BMIPS: Add support GPIO device nodes
From: Jaedon Shin <jaedon.shin@gmail.com>
In-Reply-To: <CAOiHx=kxjXiYm_4S3rLOjB0wM-UpQsqfXn+EVq6+FGOH4whuuQ@mail.gmail.com>
Date: Tue, 9 Aug 2016 10:44:14 +0900
Content-Transfer-Encoding: 8BIT
Message-ID: <D5F26D94-8312-4CAC-8577-205A1AAFB0E5@gmail.com>
References: <20160808021719.4680-1-jaedon.shin@gmail.com> <20160808021719.4680-3-jaedon.shin@gmail.com> <CAOiHx=kxjXiYm_4S3rLOjB0wM-UpQsqfXn+EVq6+FGOH4whuuQ@mail.gmail.com>
Return-Path: <jaedon.shin@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Kevin Cernekee <cernekee@gmail.com>, Rob Herring <robh+dt@kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Message-ID: <20160809014414.I8ND-FehosXBJK0bcEjZFLy9V-ZgLC9amOeKdk3oc60@z>

Hi Jonas,

On Aug 8, 2016, at 11:06 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:
> 
> Hi,
> 
> please always include devicetree for any dts(i) related changes.
> 
> On 8 August 2016 at 04:17, Jaedon Shin <jaedon.shin@gmail.com> wrote:
>> Adds GPIO device nodes to BCM7xxx MIPS based SoCs.
>> 
>> Signed-off-by: Jaedon Shin <jaedon.shin@gmail.com>
>> ---
>> arch/mips/boot/dts/brcm/bcm7125.dtsi      | 12 ++++++++++
>> arch/mips/boot/dts/brcm/bcm7346.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7358.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7360.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7362.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7420.dtsi      | 12 ++++++++++
>> arch/mips/boot/dts/brcm/bcm7425.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7435.dtsi      | 37 +++++++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 ++++
>> arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 +++++++
>> arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 +++++++
>> arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  8 +++++++
>> arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  8 +++++++
>> arch/mips/boot/dts/brcm/bcm97420c.dts     |  4 ++++
>> arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  8 +++++++
>> arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  8 +++++++
>> 16 files changed, 302 insertions(+)
>> 
>> diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> index 97191f6bca28..746ed06c85de 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> @@ -197,6 +197,18 @@
>>                        status = "disabled";
>>                };
>> 
>> +               upg_gio: gpio@406700 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406700 0x80>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 18>;
>> +               };
>> +
>>                ehci0: usb@488300 {
>>                        compatible = "brcm,bcm7125-ehci", "generic-ehci";
>>                        reg = <0x488300 0x100>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
>> index eb7b19a32e3e..1ef7540238be 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
>> @@ -232,6 +232,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408440 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408440 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <52>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406700 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406700 0x60>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 16>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@408c00 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x408c00 0x60>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <27 32 2>;
>> +               };
>> +
>>                enet0: ethernet@430000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
>> index b2276b1e12d4..bb099ee046a1 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
>> @@ -216,6 +216,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408240 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408240 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <49>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406500 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406500 0xa0>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 29 4>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@408c00 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x408c00 0x60>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <21 32 2>;
>> +               };
>> +
>>                enet0: ethernet@430000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
>> index e414af1e14ff..0aeb3de7fbc2 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
>> @@ -208,6 +208,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408440 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408440 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <49>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406500 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406500 0xa0>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 29 4>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@408c00 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x408c00 0x60>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <21 32 2>;
>> +               };
>> +
>>                enet0: ethernet@430000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
>> index 3bd1c0111d43..9a1f6ffc343d 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
>> @@ -204,6 +204,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408440 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408440 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <49>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406500 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406500 0xa0>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 29 4>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@408c00 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x408c00 0x60>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <21 32 2>;
>> +               };
>> +
>>                enet0: ethernet@430000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
>> index 27c3d45556b9..0d391d77c780 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
>> @@ -213,6 +213,18 @@
>>                        status = "disabled";
>>                };
>> 
>> +               upg_gio: gpio@406700 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406700 0x80>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 27>;
>> +               };
>> +
>>                enet0: ethernet@468000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
>> index 9ab65d64e948..04306a92b8eb 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
>> @@ -231,6 +231,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408440 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408440 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <48>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406700 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406700 0x80>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 21>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@4094c0 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x4094c0 0x40>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <18 4>;
>> +               };
>> +
>>                enet0: ethernet@b80000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
>> index 7801169416e7..c4883643ab61 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
>> @@ -246,6 +246,43 @@
>>                        status = "disabled";
>>                };
>> 
>> +               aon_pm_l2_intc: aon_pm_l2_intc@408440 {
> 
> interrupt-controller@
> 
>> +                       compatible = "brcm,l2-intc";
>> +                       reg = <0x408440 0x30>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <1>;
>> +                       interrupt-parent = <&periph_intc>;
>> +                       interrupts = <53>;
>> +                       brcm,irq-can-wake;
>> +               };
>> +
>> +               upg_gio: gpio@406700 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x406700 0x80>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       brcm,gpio-bank-widths = <32 32 32 21>;
>> +               };
>> +
>> +               upg_gio_aon: gpio@4094c0 {
>> +                       compatible = "brcm,brcmstb-gpio";
>> +                       reg = <0x4094c0 0x40>;
>> +                       #gpio-cells = <2>;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-controller;
>> +                       interrupt-controller;
>> +                       interrupt-parent = <&upg_aon_irq0_intc>;
>> +                       interrupts = <6>;
>> +                       interrupts-extended = <&upg_aon_irq0_intc 6>,
>> +                                             <&aon_pm_l2_intc 5>;
>> +                       wakeup-source;
>> +                       brcm,gpio-bank-widths = <18 4>;
>> +               };
>> +
>>                enet0: ethernet@b80000 {
>>                        phy-mode = "internal";
>>                        phy-handle = <&phy1>;
>> diff --git a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
>> index 5c24eacd72dd..91590ff55d52 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
>> @@ -49,6 +49,10 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set its status in the dtsi, it will be enabled by default,
> and you can drop this change.
> 
>> /* FIXME: USB is wonky; disable it for now */
>> &ehci0 {
>>        status = "disabled";
>> diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
>> index 2c55ab094a29..e91a21f75a13 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
>> @@ -57,6 +57,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
>> diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
>> index 757fe9d5f4df..d475a152eb2a 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
>> @@ -53,6 +53,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
>> diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
>> index 496e6ed9fae3..a445a45f51cb 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
>> @@ -49,6 +49,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
>> diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> index b880c018f3d8..22b1b506594f 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
>> @@ -45,6 +45,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
>> diff --git a/arch/mips/boot/dts/brcm/bcm97420c.dts b/arch/mips/boot/dts/brcm/bcm97420c.dts
>> index e66271af055e..428c36da91b6 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97420c.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97420c.dts
>> @@ -59,6 +59,10 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set its status in the dtsi, it will be enabled by default,
> and you can drop this change.
> 
>> /* FIXME: MAC driver comes up but cannot attach to PHY */
>> &enet0 {
>>        status = "disabled";
>> diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
>> index f091e91b11c5..6adfcd505a03 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
>> @@ -59,6 +59,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
>> diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>> index 9db84f2a6664..dd8b8fb97053 100644
>> --- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>> +++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
>> @@ -59,6 +59,14 @@
>>        status = "okay";
>> };
>> 
>> +&upg_gio {
>> +       status = "okay";
>> +};
>> +
>> +&upg_gio_aon {
>> +       status = "okay";
>> +};
>> +
> 
> You don't set their status in the dtsi, they will be enabled by
> default, and you can drop this change.
> 
>> &enet0 {
>>        status = "okay";
>> };
> 
> 
> Regards
> Jonas

The status="disabled" has been missing. It will be added in v2.
The interrupt-controller@ will also be changed.

Thanks,
Jaedon
