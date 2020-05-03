// <auto-generated />
//
// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var sample = Sample.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class Sample
    {
        [JsonProperty("widget")]
        public Widget Widget { get; set; }
    }

    public partial class Widget
    {
        [JsonProperty("debug")]
        public string Debug { get; set; }

        [JsonProperty("window")]
        public Window Window { get; set; }

        [JsonProperty("image")]
        public Image Image { get; set; }

        [JsonProperty("text")]
        public Text Text { get; set; }
    }

    public partial class Image
    {
        [JsonProperty("src")]
        public string Src { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("hOffset")]
        public long HOffset { get; set; }

        [JsonProperty("vOffset")]
        public long VOffset { get; set; }

        [JsonProperty("alignment")]
        public string Alignment { get; set; }
    }

    public partial class Text
    {
        [JsonProperty("data")]
        public string Data { get; set; }

        [JsonProperty("size")]
        public long Size { get; set; }

        [JsonProperty("style")]
        public string Style { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("hOffset")]
        public long HOffset { get; set; }

        [JsonProperty("vOffset")]
        public long VOffset { get; set; }

        [JsonProperty("alignment")]
        public string Alignment { get; set; }

        [JsonProperty("onMouseUp")]
        public string OnMouseUp { get; set; }
    }

    public partial class Window
    {
        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("width")]
        public long Width { get; set; }

        [JsonProperty("height")]
        public long Height { get; set; }
    }

    public partial class Sample
    {
        public static Sample FromJson(string json) => JsonConvert.DeserializeObject<Sample>(json, QuickType.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this Sample self) => JsonConvert.SerializeObject(self, QuickType.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }
}
