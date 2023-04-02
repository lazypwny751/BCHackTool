# Dil ayarları.
Dil ayarları aracımızın en mühim bileşenlerinden biridir, bir nevi i18n çakması
bir araç oluşturmayı denedik, ileride bir framework haline gelirsek i18n'e geçmeyi
düşünüyoruz.

## Nasıl çalışır?
Çalışam mekanizması çok basit bir düzenektir, proje dizinin altındaki "language"
dizininden dil dosyalarını okur dil dosyalarının ad eklentisi hangi yöreye ait olduğunu
gösterir, mesela "Türkçe" için "tr" veya "Azerice" için "az" ile biter, eklemek istediğiniz
bir dil var ise bu lütfen kurala uyun, dosya adı sadece "language.->dil<-" şeklinde olabilir.

## Dil dosyası nasıl olmalıdır?
Anahtar değer mantığı düşünebilirsiniz hatta değişken mantığı daha basit bir tanım olacaktır
size en yakın gelen dil'i referans alın ve yeni bir dil dosyası açın lakin unutmayın, ayraç olarak " : "
kullanılıyor boşluklar da dahil.